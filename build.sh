if [ -z $1 ]; then
	echo "No toolchain specified!"
	exit
fi
if [ ! -f toolchain-$1.cmake ]; then
	echo "file doesntnt exist!"
	exit
fi
cd source
cmake -B build-install-$1 -DCMAKE_INSTALL_PREFIX=../$1 -DCMAKE_TOOLCHAIN_FILE=../toolchain-$1.cmake && echo "--- Finished configuring ---" && cmake --build build-install-$1 --target install
