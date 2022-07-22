set(CMAKE_SYSTEM_NAME Windows)
set(CMAKE_SYSTEM_VERSION 10.0)

set(WINSDK_DIR $ENV{HOME}/winsdk)
set(LLVM_DIR $ENV{HOME}/llvm-project)
set(CLANG_INCLUDE_DIR ${LLVM_DIR}/build/lib/clang/15.0.0)

list(APPEND CMAKE_PREFIX_PATH "$ENV{HOME}/JUCE/win")

# cross compilers to use for C, C++ and Fortran
set(CMAKE_C_COMPILER clang-cl)
set(CMAKE_CXX_COMPILER clang-cl)
set(CMAKE_RC_COMPILER llvm-rc)
set(CFLAGS "-Wno-unused-command-line-argument -fuse-ld=lld-link")
set(CXXFLAGS "-Wno-unused-command-line-argument -fuse-ld=lld-link")
set(CMAKE_AR llvm-lib)
set(CMAKE_MT llvm-mt)
set(CMAKE_LINKER lld-link)

# target environment on the build host system
set(CMAKE_FIND_ROOT_PATH "${CLANG_INCLUDE_DIR};${WINSDK_DIR}/sdk;${WINSDK_DIR}/crt")

# modify default behavior of FIND_XXX() commands
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
set(CMAKE_FIND_LIBRARY_PREFIXES "lib" "")
set(CMAKE_FIND_LIBRARY_SUFFIXES ".dll" ".dll.a" ".lib" ".a")

add_link_options("/libpath:${LLVM_DIR}/clang/test/Driver/Inputs/resource_dir/lib/windows")
add_link_options("/libpath:${LLVM_DIR}/lld/test/COFF/Inputs/")
add_link_options("/libpath:${WINSDK_DIR}/sdk/lib/ucrt/x86_64")
add_link_options("/libpath:${WINSDK_DIR}/sdk/lib/um/x86_64")
add_link_options("/libpath:${WINSDK_DIR}/crt/lib/x86_64")

include_directories(${CLANG_INCLUDE_DIR}/include)
include_directories(${WINSDK_DIR}/crt/include)
include_directories(${WINSDK_DIR}/sdk/include/ucrt)
include_directories(${WINSDK_DIR}/sdk/include/um)
include_directories(${WINSDK_DIR}/sdk/include/shared)
