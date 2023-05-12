# cuda-profiliing

### build
sh ./build.sh

### run

nsys profile -t cuda,nvtx --force-overwrite=true -o demo ./kernel
