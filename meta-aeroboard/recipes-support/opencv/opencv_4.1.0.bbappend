# meta-aeroboard/recipes-support/opencv/opencv_4.1.0.bbappend

EXTRA_OECMAKE:append = " \
    -DCPU_BASELINE=NEON \
    -DCPU_BASELINE_REQUIRE="" \
    -DHAVE_CPU_NEON_SUPPORT=ON \
    -DWITH_EIGEN=OFF \
    -DWITH_CUDA=OFF \
    -DWITH_OPENCL=OFF \
    -DENABLE_PRECOMPILED_HEADERS=OFF \
    -DWITH_CAROTENE=OFF \
    -DBUILD_OPENEXR=OFF \
    -DWITH_OPENEXR=OFF \
    -DBUILD_ZLIB=OFF \
    -DBUILD_TIFF=OFF \
    -DBUILD_JASPER=OFF \
    -DBUILD_JPEG=OFF \
    -DBUILD_PNG=OFF \
    -DBUILD_WEBP=OFF \
    -DBUILD_TBB=OFF \
    -DBUILD_IPP_IW=OFF \
    -DBUILD_ITT=OFF \
    -DBUILD_PROTOBUF=ON \
    -DOPENCV_GENERATE_SETUPVARS=OFF \
    -DPROTOBUF_UPDATE_FILES=OFF \
    -DBUILD_TESTS=OFF \
    -DBUILD_PERF_TESTS=OFF \
    -DBUILD_EXAMPLES=OFF \
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