# meta-aeroboard/recipes-support/opencv/opencv_4.1.0.bbappend

PACKAGECONFIG:append = " dnn protobuf"

EXTRA_OECMAKE:append = " \
    -DCPU_BASELINE=NEON \
    -DCPU_BASELINE_REQUIRE= \
    -DHAVE_CPU_NEON_SUPPORT=ON \
    -DWITH_EIGEN=OFF \
    -DWITH_CUDA=OFF \
    -DWITH_OPENCL=OFF \
    -DENABLE_PRECOMPILED_HEADERS=OFF \
    -DWITH_CAROTENE=OFF \
    -DWITH_OPENEXR=OFF \
    -DWITH_TBB=ON \
    -DBUILD_TESTS=OFF \
    -DBUILD_PERF_TESTS=OFF \
    -DBUILD_EXAMPLES=OFF \
    -DBUILD_PROTOBUF=OFF \
"

# Override do_configure to prepend sysroot to compiler flags AFTER cmake runs
# so OpenCV can't strip them out
do_configure:append() {
    # Patch all cmake-generated flags files to add --sysroot to CXX flags
    SYSROOT="${RECIPE_SYSROOT}"
    find ${B} -name "flags.make" | xargs -I{} sed -i \
        "s|CXX_FLAGS = |CXX_FLAGS = --sysroot=${SYSROOT} |g" {}
    find ${B} -name "flags.make" | xargs -I{} sed -i \
        "s|CXX_FLAGS_RELEASE = |CXX_FLAGS_RELEASE = --sysroot=${SYSROOT} |g" {}
    find ${B} -name "build.ninja" | xargs -I{} sed -i \
        "s|-fvisibility-inlines-hidden |-fvisibility-inlines-hidden --sysroot=${SYSROOT} |g" {}
}