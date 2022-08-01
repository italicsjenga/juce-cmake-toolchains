list(APPEND CMAKE_PREFIX_PATH "$ENV{HOME}/JUCE")

#set(CMAKE_C_COMPILER clang)
#set(CMAKE_CXX_COMPILER clang++)
#set(CMAKE_AR llvm-ar)
#set(CMAKE_LINKER l64.lld)
#set(CMAKE_RANLIB llvm-ranlib)

#set(CMAKE_CXX_FLAGS "-arch arm64 -arch x86_64")

set(CMAKE_OSX_ARCHITECTURES "arm64;x86_64" CACHE STRING "")
