#!/bin/sh
#build last picotls master (for Travis)

# Build at a known-good commit
COMMIT_ID=9cab5f9fd82040fcbf6a4cb0ac276dec6c6aa48f

cd ..
git clone --branch master --single-branch --shallow-submodules --recurse-submodules --no-tags https://github.com/h2o/picotls
cd picotls
git checkout "$COMMIT_ID"
#git submodule init
#git submodule update
cmake $CMAKE_OPTS .
make -j$(nproc) all
cd ..
