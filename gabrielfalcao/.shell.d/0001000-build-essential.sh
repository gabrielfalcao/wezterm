# export PYTHON_PKG_CONFIG_LIBS=$(g o -n\
#                                      libuvc \
#                                      libevent \
#                                      libevent_core \
#                                      libevent_extra \
#                                      libevent_openssl \
#                                      libevent_pthreads \
#                                      qt@5 \
#                                      liblz4 \
#                                      libressl \
#                                      libuv \
#                                      tesseract \
#                                      libev \
#                                      libzstd \
#                                     | tr '[:space:]' ' ')

# export PKG_CONFIG_LIBS=$(g o -n \
#                               libuvc \
#                               gnutls \
#                               gnutls-dane \
#                               libevent \
#                               qt@5 \
#                               libevent_core \
#                               libevent_extra \
#                               libevent_openssl \
#                               libevent_pthreads \
#                               libgcrypt \
#                               libiodbc \
#                               liblz4 \
#                               libmicrohttpd \
#                               libpng \
#                               libsodium \
#                               libssh2 \
#                               libusb \
#                               tesseract \
#                               libuv \
#                               libyaml \
#                               libwebp \
#                               libzmq \
#                               libzstd \
#                               lua@5.3 \
#                               openssl \
#                              | tr '[:space:]' ' ')

# export BREW_LIBS=$(g o -e \
#                         bzip2 \
#                         gdbm \
#                         libev \
#                         libuvc \
#                         libffi \
#                         libpcap \
#                         libuv \
#                         libzip \
#                         zlib \
#                        | tr '[:space:]' ' ')
# export DEFAULT_PKG_CONFIG_LIBS="${PKG_CONFIG_LIBS} ${BREW_LIBS}"

# function enable_buildessential_environment_variables() {
#     # brew uninstall ccache pyenv-ccache
#     # brew install gnu-make colordiff cern-ndiff
#     verbose=$1
#     export CFLAGS="-fPIC -Wreturn-type -Wunused-const-variable -Wmissing-declarations" # -fuse-ld=gold"
#     # export CFLAGS="-fPIC -Wunused-function -Wreturn-type -Wunused-const-variable=0 -Wbuiltin-declaration-mismatch -fuse-ld=gold"
#     # export CFLAGS="-fPIC -Wunused-function -Wreturn-type -Wunused-const-variable=0 -Wbuiltin-declaration-mismatch -Wunused-dummy-argument" # cc1: warning: command-line option '-Wunused-dummy-argument' is valid for Fortran but not for C
#     export MAKE=$(which gmake)
#     export -n PKG_CONFIG_PATH="" CPPFLAGS="" LIBS="" PYTHON_CFLAGS="" CONFIGURE_OPTS=""
#     for name in ${BREW_LIBS}; do
#         lib_path="$(brew --prefix "$name")/lib"
#         if [ -d "${lib_path}" ]; then
#             pkgconfig_path="${lib_path}/pkgconfig"
#             if [ -d "${pkgconfig_path}" ]; then
#                 test ${verbose} && 1>&2 g o -e "\x1b[1;38;5;124mexport \x1b[1;38;5;24mPKG_CONFIG_PATH=\x1b[1;38;5;220m${pkgconfig_path}\x1b[0m"
#                 export PKG_CONFIG_PATH="${pkgconfig_path}:${PKG_CONFIG_PATH}"
#             fi
#         fi
#     done
#     for name in $DEFAULT_PKG_CONFIG_LIBS; do
#         if [ "$name" == "tcl-tk" ]; then
#             #pkg-config --libs --cflags tcl-tk
#             test ${verbose} && 1>&2 g o -e "...TK" > /dev/null
#         fi

#         if pkg-config "${name}" 2>/dev/null; then
#             test ${verbose} && 1>&2 g o -e "\x1b[1;38;5;118mexport \x1b[0;32mLIBS=\x1b[1;32m$(pkg-config --libs "${name}")\x1b[0m"
#             test ${verbose} && 1>&2 g o -e "\x1b[1;38;5;184mexport \x1b[0;33mCFLAGS=\x1b[1;33m$(pkg-config --cflags "${name}")\x1b[0m"
#             test ${verbose} && 1>&2 g o -e "\x1b[1;38;5;69mexport \x1b[1;38;5;27mCPPFLAGS=\x1b[1;34m$(pkg-config --cflags "${name}")\x1b[0m"
#             test ${verbose} && 1>&2 g o -e "\x1b[1;38;5;137mexport \x1b[1;37mPYTHON_CFLAGS=\x1b[0;32m$(pkg-config --cflags "${name}")\x1b[0m"
#             export CPPFLAGS="$(pkg-config --cflags "${name}") ${CPPFLAGS}"
#             export LIBS="$(pkg-config --libs "${name}") ${LIBS}"
#             export CFLAGS="$(pkg-config --cflags "${name}") ${CFLAGS}"
#             export PYTHON_CFLAGS="${CFLAGS}"
#         else
#             basepath=$(brew --prefix "$name");
#             if [ -e "${basepath}" ]; then
#                 iterlib="${basepath}/lib"
#                 iterflags="${basepath}/include"
#                 if [ -d "${iterlib}" ]; then
#                     # test ${verbose} && 1>&2 g o -e "\x1b[0;31mexport \x1b[1;31mLIBS=-L${iterlib}\x1b[0m"
#                     # export LIBS="-L${iterlib} ${LIBS}"
#                     libname="${name/lib}"
#                     if [ "$libname" == "$name" ]; then
#                         test ${verbose} && 1>&2 g o -e "\x1b[1;37mwarning: \x1b[1;33m${name} does not appear to be a lib\x1b[0m"
#                     else
#                         test ${verbose} && 1>&2 g o -e "\x1b[0;31mexport \x1b[1;31mLIBS=-L${iterlib} \x1b[1;37m-l${name}\x1b[0m"
#                         export LIBS="-L${iterlib} -l${libname} ${LIBS}"
#                     fi
#                     unset libname iterlib iterflags
#                 fi
#                 if [ -d "${iterflags}" ]; then
#                     export CPPFLAGS="-I${iterflags} ${CPPFLAGS}"
#                     export CFLAGS="-I${iterflags} ${CFLAGS}"
#                     test ${verbose} && 1>&2 g o -e "\x1b[0;37mexport \x1b[1;37mCFLAGS=-I${iterflags}\x1b[0m"
#                     test ${verbose} && 1>&2 g o -e "\x1b[0;34mexport \x1b[1;34mCPPFLAGS=-I${iterflags}\x1b[0m"
#                 else
#                     test ${verbose} && 1>&2 g o -e "\x1b[1;31m$(figlet -f small not installed)\n\x1b[1;33m${name}\x1b[0m"
#                     test ${verbose} && 1>&2 g o -e "\t\x1b[1;30m${iterflags}\x1b[0m"
#                 fi
#             fi
#         fi
#     done
#     unset verbose basepath
# }

# function enable_pyenv_build_env() {
#     verbose=$1
#     # exec 4>/tmp/${verbose}.enable_pyenv_build_env
#     export PYTHON_BUILD_SKIP_HOMEBREW=1
#     export -n PYTHON_BUILD_SKIP_MIRROR=
#     export -n PYTHON_CONFIGURE_OPTS=

#     export CPPFLAGS="$HOME/opt/include"
#     export LDFLAGS="$HOME/opt/lib"
#     export CC="xcrun -sdk macosx13.3 clang"
#     export OBJC="xcrun -sdk macosx13.3 clang"
#     export CPPFLAGS="-mmacosx-version-min=11.1 -arch arm64 -Wall -O2"
#     export CFLAGS="-mmacosx-version-min=11.1 -arch arm64 -Wall -O2"
#     export OBJCFLAGS="-mmacosx-version-min=11.1 -arch arm64 -O2 -Wall"
#     export PATH=$(g env path PATH -s /bin)
#     export PYTHON_BUILD_ARIA2_OPTS="-x 10 -k 1M"
#     export -n PYTHON_BUILD_SKIP_HOMEBREW=
#     export -n PYTHON_BUILD_SKIP_MIRROR=
#     export -n PYTHON_BUILD_BUILD_PATH=
#     export -n PYTHON_BUILD_CACHE_PATH=

#     # export PYTHON_BUILD_BUILD_PATH="${HOME}/.pyenv/__tmp__"
#     # export PYTHON_BUILD_CACHE_PATH="${HOME}/.pyenv/__build_cache__"
#     # rm -rf ${PYTHON_BUILD_BUILD_PATH} ${PYTHON_BUILD_CACHE_PATH}
#     # mkdir -p ${PYTHON_BUILD_BUILD_PATH}
#     # mkdir -p ${PYTHON_BUILD_CACHE_PATH}

#     export PYTHONHASHSEED=8675309
#     export PYTHONUNBUFFERED=1
#     export PYTHONDONTWRITEBYTECODE=1
#     export LIBFFI_INCLUDEDIR="$(brew --prefix libffi)/include"
#     export PYTHONDEVMODE=1
#     export PYTHONUTF8=1

#     enable_buildessential_environment_variables ${verbose}
#     # export CC=$(brew --prefix --installed gcc@12)/bin/aarch64-apple-darwin22-gcc-14

#     formula=aria2
#     if brew --prefix --installed "${formula}" > /dev/null; then
#         export PYTHON_BUILD_ARIA2_OPTS="-x 10 -k 1M"
#     else
#         test ${verbose} && 1>&2 g o -e "\x1b[1;38;5;124mbrew formula not installed: \x1b[1;38;5;160m${formula}\x1b[0m"
#     fi
#     # 0
#     export PYTHON_BUILD_SKIP_HOMEBREW=sure
#     export PYTHON_BUILD_SKIP_MIRROR=sure
#     export PYTHON_CONFIGURE_OPTS="--with-computed-gotos --with-system-ffi --enable-optimizations --with-lto ${PYTHON_CONFIGURE_OPTS}"
#     export PYTHON_CONFIGURE_OPTS="${PYTHON_CONFIGURE_OPTS} --enable-loadable-sqlite-extensions"

#     export PYTHON_CONFIGURE_OPTS="--enable-profiling"
#     export PYTHON_CONFIGURE_OPTS="${PYTHON_CONFIGURE_OPTS} --disable-ipv6"
#     export PYTHON_CONFIGURE_OPTS="${PYTHON_CONFIGURE_OPTS} --enable-shared" # pyenv appears to prefix with this already, here just as reminder ;)
#     # 1
#     # export PYTHON_CONFIGURE_OPTS="${PYTHON_CONFIGURE_OPTS} --enable-ipv6"
#     # export -n CC=gcc-14
#     # export -n CXX=g++-14
#     alias gcc="${CC}"
#     # export PYTHON_CONFIGURE_OPTS="${PYTHON_CONFIGURE_OPTS} --without-gcc"
#     # export PYTHON_CONFIGURE_OPTS="${PYTHON_CONFIGURE_OPTS} --with-icc"
#     # export PYTHON_CONFIGURE_OPTS="${PYTHON_CONFIGURE_OPTS} --enable-big-digits=42"  # checking digit size for Python's longs... configure: error: bad value 42 for --enable-big-digits; value should be 15 or 30
#     export PYTHON_CONFIGURE_OPTS="${PYTHON_CONFIGURE_OPTS} --enable-big-digits=29"
#     # 2
#     # export PYTHON_CONFIGURE_OPTS="${PYTHON_CONFIGURE_OPTS} --enable-framework" #[=INSTALLDIR]
#     # export PYTHON_CONFIGURE_OPTS="${PYTHON_CONFIGURE_OPTS} --enable-universalsdk" #[=SDKDIR]
#     # export PYTHON_CONFIGURE_OPTS="${PYTHON_CONFIGURE_OPTS} --with-universal-archs"
#     # export PYTHON_CONFIGURE_OPTS="${PYTHON_CONFIGURE_OPTS} --with-pydebug" # pyenv appears to prefix with this already, here just as reminder :)
#     export PYTHON_CONFIGURE_OPTS="${PYTHON_CONFIGURE_OPTS} --target=arm64"
#     for name in $(g o $PYTHON_PKG_CONFIG_LIBS); do
#         export PYTHON_CONFIGURE_OPTS="${PYTHON_CONFIGURE_OPTS} --with-libs=${name}"
#     done

#     export PYTHON_CONFIGURE_OPTS="${PYTHON_CONFIGURE_OPTS} --with-system-libmpdec" # cat Python-3.7.16/Misc/NEWS.d/next/Core and Builtins/2020-06-30-04-44-29.bpo-41100.PJwA6F.rst: ``add arm64 to the allowable Mac OS arches in mpdecimal.h``
#     export PYTHON_CONFIGURE_OPTS="${PYTHON_CONFIGURE_OPTS} --with-decimal-contextvar"
#     export PYTHON_CONFIGURE_OPTS="${PYTHON_CONFIGURE_OPTS} --with-c-locale-coercion"
#     # 3
#     # # export PYTHON_CONFIGURE_OPTS="${PYTHON_CONFIGURE_OPTS} --with-valgrind" # nür für GNU/Linux
#     # # export PYTHON_CONFIGURE_OPTS="${PYTHON_CONFIGURE_OPTS} --with-dtrace"
#     export PYTHON_CONFIGURE_OPTS="${PYTHON_CONFIGURE_OPTS} --with-ensurepip=upgrade"
#     export PYTHON_CONFIGURE_OPTS="${PYTHON_CONFIGURE_OPTS} --with-ssl-default-suites=python"

#     # 4
#     # # point to ``gcc`` installed via ``brew install --build-from-source gcc``
#     # export CC=/opt/homebrew/opt/gcc/bin/gcc-14
#     # export CXX=/opt/homebrew/opt/gcc/bin/c++-14
#     export PYTHON_CONFIGURE_OPTS="${PYTHON_CONFIGURE_OPTS} --with-cxx-main=/opt/homebrew/opt/gcc/bin/c++-14"
#     # # 5,6
#     # formula=openssl@3
#     # if ssllibdir=$(brew --prefix --installed "${formula}"); then
#     #     test ${verbose} && 1>&2 g o -e "\x1b[1;38;5;172mexport \x1b[1;38;5;137mPYTHON_CONFIGURE_OPTS=\x1b[1;37m\"--with-openssl=${ssllibdir}\""
#     #     export PYTHON_CONFIGURE_OPTS="${PYTHON_CONFIGURE_OPTS} --with-openssl=${ssllibdir}"
#     # else
#     #     test ${verbose} && 1>&2 g o -e "\x1b[1;38;5;124mbrew formula not installed: \x1b[1;38;5;160m${formula}\x1b[0m"
#     # fi
#     # # # exec 4 <&-

#     # Export the environment variable PYTHON_DECIMAL_WITH_MACHINE=x64 (uint128 for aarch64, ppro for x86). No further patch would be needed.
#     export PYTHON_DECIMAL_WITH_MACHINE=uint128
# }
# function disable_pyenv_specific_envs_for_pip() {
#     # run this before ``pip install...``
#     export CC=$(which clang)
#     export CXX=$(which clang++)
#     export -n CFLAGS=""
#     export -n PYTHON_CFLAGS=""
# }

# # enable_buildessential_environment_variables

# # enable vulkan for qt5 development
# if vulkan_path="$(brew --prefix vulkan-tools)"; then
#     export VK_ICD_FILENAMES="${vulkan_path}/lib/mock_icd/VkICD_mock_icd.json"
# fi
# unset vulkan_path

# declare +x PYTHON_BUILD_BUILD_PATH
# declare +x PYTHON_BUILD_CACHE_PATH
# declare +x PYTHON_BUILD_SKIP_HOMEBREW
# declare +x PYTHON_BUILD_SKIP_MIRROR
# declare +x PYTHON_CFLAGS
# declare +x PYTHON_CONFIGURE_OPTS
# declare +x DEFAULT_PKG_CONFIG_LIBS
# declare +x LIBFFI_INCLUDEDIR
# declare +x MAKE
# declare +x PYTHON_BUILD_ARIA2_OPTS
# declare +x PYTHON_DECIMAL_WITH_MACHINE
# declare +x PYTHON_PKG_CONFIG_LIBS
