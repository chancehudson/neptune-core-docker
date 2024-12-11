docker run -it -v $(pwd)/neptune:/root/.local -p 9799:9799 --rm -e TVM_LDE_TRACE=no_cache $(docker build . -q) /neptune/neptune-core --compose --guess
