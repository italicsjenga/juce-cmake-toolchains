set(CMAKE_SYSTEM_NAME Windows)
set(TOOLCHAIN_PREFIX x86_64-w64-mingw32)

list(APPEND CMAKE_PREFIX_PATH "$HOME/JUCE/win-mingw")

# cross compilers to use for C, C++ and Fortran
set(CMAKE_C_COMPILER ${TOOLCHAIN_PREFIX}-gcc-posix)
set(CMAKE_CXX_COMPILER ${TOOLCHAIN_PREFIX}-g++-posix)
set(CMAKE_Fortran_COMPILER ${TOOLCHAIN_PREFIX}-gfortran)
set(CMAKE_RC_COMPILER ${TOOLCHAIN_PREFIX}-windres)
set(CMAKE_RC_FLAGS -DGCC_WINDRES)

set(CMAKE_AR ${TOOLCHAIN_PREFIX}-ar)
set(CMAKE_LINKER ${TOOLCHAIN_PREFIX}-ld)

# target environment on the build host system
set(CMAKE_FIND_ROOT_PATH /usr/${TOOLCHAIN_PREFIX})
# set(CMAKE_FIND_ROOT_PATH /usr/${TOOLCHAIN_PREFIX}/include)

# modify default behavior of FIND_XXX() commands
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)

set(CMAKE_FIND_LIBRARY_PREFIXES "lib" "")
set(CMAKE_FIND_LIBRARY_SUFFIXES ".dll" ".dll.a" ".lib" ".a")

set(CMAKE_EXE_LINKER_FLAGS_INIT "-static-libgcc -static-libstdc++ --static")
add_link_options("--static")

set(CMAKE_CXX_IMPLICIT_INCLUDE_DIRECTORIES /usr/lib/gcc/${TOOLCHAIN_PREFIX}/10-posix)
