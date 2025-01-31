#!/bin/sh -e

# 从 aria2c 官方仓库获取最新的版本标签
VERSION=$(git ls-remote --tags https://github.com/aria2/aria2.git | awk -F/ '{print $3}' | grep -v {} | sort -V | tail -n1)

if [ -z "$VERSION" ]; then
    echo "无法获取 aria2c 版本信息"
    exit 1
fi

echo "正在构建 aria2c 版本: $VERSION"

# 定义外部依赖的版本
GMP_VERSION=6.3.0
EXPAT_VERSION=2.5.0
SQLITE_YEAR=2023
SQLITE_VERSION=3430100
ZLIB_VERSION=1.3.1
CARES_VERSION=1.19.1
LIBSSH2_VERSION=1.11.0

release_mingw()
{
    export HOST=$1
    export LABEL=$2

    mkdir -p mingw-out

    docker build \
	   --build-arg HOST=$HOST \
	   --build-arg ARIA2_VERSION=$VERSION \
	   --build-arg ARIA2_REF=refs/tags/$VERSION \
	   --build-arg GMP_VERSION=$GMP_VERSION \
	   --build-arg EXPAT_VERSION=$EXPAT_VERSION \
	   --build-arg SQLITE_YEAR=$SQLITE_YEAR \
	   --build-arg SQLITE_VERSION=$SQLITE_VERSION \
	   --build-arg ZLIB_VERSION=$ZLIB_VERSION \
	   --build-arg CARES_VERSION=$CARES_VERSION \
	   --build-arg LIBSSH2_VERSION=$LIBSSH2_VERSION \
	   -t aria2-mingw-$HOST - < Dockerfile/Dockerfile.mingw.txt

    docker run --rm -it -v $PWD/mingw-out:/out aria2-mingw-$HOST \
	   cp /aria2/src/aria2c.exe /out

    ./mingw-release

    rm -rf mingw-out
}

# mingw 32bit
release_mingw i686-w64-mingw32 win-32bit

# mingw 64bit
release_mingw x86_64-w64-mingw32 win-64bit