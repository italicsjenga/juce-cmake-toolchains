if [ -z $1 ]; then
	echo "No toolchain specified!"
	return
fi
cd source
cmake -B cmake-build-install-$1 -DCMAKE_INSTALL_PREFIX=../$1 -DCMAKE_TOOLCHAIN_FILE=../toolchain-$1.cmake && cmake --build cmake-build-install-$1 --target install
