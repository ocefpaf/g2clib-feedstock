#!/bin/sh


if [[ ${ARCH:-32} == "64" ]]; then
    DEFS='-DUSE_PNG -DUSE_JPEG2000 -D__64BIT__';
else
    DEFS='-DUSE_PNG -DUSE_JPEG2000';
fi

export INC="-I${PREFIX}/include"
export CFLAGS="$CFLAGS $DEFS -fPIC -I${PREFIX}/include"
# The original name is "libg2c_v1.6.0.a" but the changes in this version are
# mostly bugfixes that do not deserve a versioned lib name.
# In addition lib name change break other packages.
export LIB="libgrib2c.a"

make -e
cp *.h ${PREFIX}/include
cp ${LIB} ${PREFIX}/lib
