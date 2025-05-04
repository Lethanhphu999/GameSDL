mkdir -p build

cmake -S . -B build -G Ninja
cmake --build build -j8

cd build
./hello
