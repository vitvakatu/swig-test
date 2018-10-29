#!/usr/bin/env bash
# !!! This script is only usable on MacOS !!!

set -eu -o pipefail

BINDING_TEST_LIB_DIR=./binding-test-library
ROOT_DIR=$(pwd)

JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_191.jdk/Contents/Home

if [ ! -d "$BINDING_TEST_LIB_DIR" ]; then
    git clone https://github.com/vitvakatu/binding-test-library ${BINDING_TEST_LIB_DIR}
    cd "$BINDING_TEST_LIB_DIR"
    cargo build
    cd "$ROOT_DIR"
fi

# Generate SWIG wrappers
swig -java -outdir ./src/main/java/wrapper/ -package wrapper ./binding-test-library.i

# Compile SWIG wrapper
gcc -c binding-test-library_wrap.c -I"${JAVA_HOME}"/include/ -I"${JAVA_HOME}"/include/darwin/ -fPIC

# Link SWIG wrapper to dylib together with binding_test_library
gcc -shared binding-test-library_wrap.o -o libbinding_test_library_java.dylib -lbinding_test_library -L"${BINDING_TEST_LIB_DIR}"/target/debug/
