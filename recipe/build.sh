#!/bin/sh


if [[ ${ARCH:-32} == "64" ]]; then
    DEFS='-DUSE_PNG -DUSE_JPEG2000 -D__64BIT__';
else
    DEFS='-DUSE_PNG -DUSE_JPEG2000';
fi

export INC="-I${PREFIX}/include"
export CFLAGS="$CFLAGS $DEFS -fPIC -I${PREFIX}/include"

make -e
cp *.h ${PREFIX}/include
cp libg2c_v1.6.0.a ${PREFIX}/lib
