#/bin/bash -x

autoreconf -vif

if [ $(uname) == "Darwin" ]; then
    ##
    # Tweeks to get good compile on OSX
    env OBJCXXFLAGS='-std=c++11 -stdlib=libc++ -Wno-unused-local-typedef' \
	CXXFLAGS='-Wno-unused-local-typedef  -std=c++11 -stdlib=libc++' \
	CFLAGS='-Wno-unused-local-typedef' PKG_CONFIG_PATH=/usr/local/Cellar/qt/5.10.0_1/lib/pkgconfig \
	./configure --with-boost=/usr/local/Cellar/boost@1.57/1.57.0
fi

if [ $(uname) == "Linux" ]; then
    env CFLAGS='-Wno-builtin-declaration-mismatch' \
       	CXXFLAGS='-Wno-builtin-declaration-mismatch' \
	./configure
fi

