list(APPEND CMAKE_PREFIX_PATH "$HOME/JUCE/mac")

# Sample toolchain file for building for Mac OS X from an Ubuntu Linux system.
#
# Typical usage:
# *) install cross compiler from https://github.com/tpoechtrager/osxcross
# *) mkdir build
# *) cd build
# *) cmake -DCMAKE_TOOLCHAIN_FILE=/path/to/ubuntu-osxcross-10.7.cmake ..
set(CMAKE_SYSTEM_NAME Darwin)
set(TOOLCHAIN_PREFIX x86_64-apple-darwin20.4)
set(OSXCROSS /usr/local/osxcross)
set(SDK ${OSXCROSS}/SDK/MacOSX11.3.sdk)

# cross compilers to use for C and C++
set(CMAKE_C_COMPILER ${TOOLCHAIN_PREFIX}-clang)
set(CMAKE_CXX_COMPILER ${TOOLCHAIN_PREFIX}-clang++)
set(CMAKE_AR ${TOOLCHAIN_PREFIX}-ar)
set(CMAKE_LINKER ${TOOLCHAIN_PREFIX}-ld)
set(CMAKE_RANLIB ${TOOLCHAIN_PREFIX}-ranlib)

set(CMAKE_CXX_FLAGS "-arch arm64 -arch x86_64")

set(CMAKE_OSX_ARCHITECTURES "x86_64;arm64" CACHE STRING "")

# target environment on the build host system
# set 1st to dir with the cross compiler's C/C++ headers/libs
set(CMAKE_FIND_ROOT_PATH ${OSXCROSS})

# set(CMAKE_FIND_ROOT_PATH ${SDK}/usr)
# set(CMAKE_FIND_ROOT_PATH ${SDK}/System/Library/Frameworks)
set(CMAKE_FRAMEWORK_PATH ${SDK}/System/Library/Frameworks)

set(CMAKE_OSX_SYSROOT ${SDK})

set(CMAKE_INSTALL_LIB_PREFIX ${SDK}/usr/lib)

# modify default behavior of FIND_XXX() commands to
# search for headers/libs in the target environment and
# search for programs in the build host environment
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)

set(CMAKE_SHARED_LIBRARY_RUNTIME_C_FLAG "-Wl,-rpath,")
set(CMAKE_SHARED_LIBRARY_RUNTIME_C_FLAG_SEP ":")

# more linking variables
set(CMAKE_INSTALL_NAME_DIR "@rpath")
set(CMAKE_INSTALL_RPATH ...)

# set(CMAKE_EXE_LINKER_FLAGS_INIT "-static-libgcc -static-libstdc++ --static")
# add_link_options("--static")
