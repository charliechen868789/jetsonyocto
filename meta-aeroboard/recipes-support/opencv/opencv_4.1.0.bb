SUMMARY = "OpenCV for AeroBoard (Jetson Nano, no CUDA/OpenCL)"
HOMEPAGE = "http://opencv.org/"
LICENSE = "BSD-3-Clause"
LIC_FILES_CHKSUM = "file://LICENSE;md5=1fb87109845571ec3f26bc2b6e5c8e54"

DEPENDS = "zlib jpeg libpng tiff gstreamer1.0 gstreamer1.0-plugins-base python3 python3-numpy tbb protobuf protobuf-native"

SRC_URI = "https://github.com/opencv/opencv/archive/${PV}.tar.gz;name=opencv \
           https://github.com/opencv/opencv_contrib/archive/${PV}.tar.gz;name=contrib"

SRC_URI[opencv.md5sum] = "dd1b7b0a40a0b44e7f7ea85e5f9e5e4c"
SRC_URI[opencv.sha256sum] = "8f6e4ab393d81d72caae6e78bd0fd6956117ec9f006fba55fcdb88caf62989b7"
SRC_URI[contrib.md5sum] = "0a8a6cbb2c298f64bd13f0cfbf7b9ef4"
SRC_URI[contrib.sha256sum] = "7105b5c74fc6413d5b0e9f8e6b3ef0e3aded52a67ea1c5b5a78a4d1c04282fac"

S = "${WORKDIR}/opencv-${PV}"

inherit cmake python3native

EXTRA_OECMAKE = " \
    -DOPENCV_EXTRA_MODULES_PATH=${WORKDIR}/opencv_contrib-${PV}/modules \
    -DWITH_CUDA=OFF \
    -DWITH_OPENCL=OFF \
    -DWITH_OPENCL_SVM=OFF \
    -DWITH_OPENCLAMDFFT=OFF \
    -DWITH_OPENCLAMDBLAS=OFF \
    -DWITH_CUDNN=OFF \
    -DWITH_CUFFT=OFF \
    -DWITH_CUBLAS=OFF \
    -DBUILD_opencv_sfm=OFF \
    -DBUILD_opencv_viz=OFF \
    -DBUILD_opencv_cvv=OFF \
    -DBUILD_opencv_hdf=OFF \
    -DBUILD_opencv_java=OFF \
    -DBUILD_TESTS=OFF \
    -DBUILD_PERF_TESTS=OFF \
    -DBUILD_EXAMPLES=OFF \
    -DBUILD_DOCS=OFF \
    -DWITH_1394=OFF \
    -DWITH_GTK=OFF \
    -DWITH_GSTREAMER=ON \
    -DWITH_JPEG=ON \
    -DWITH_PNG=ON \
    -DWITH_TIFF=ON \
    -DWITH_V4L=ON \
    -DWITH_LIBV4L=ON \
    -DWITH_TBB=ON \
    -DBUILD_opencv_dnn=ON \
    -DBUILD_PROTOBUF=OFF \
    -DPROTOBUF_UPDATE_FILES=ON \
    -DCPU_BASELINE=NEON \
    -DCPU_DISPATCH='' \
    -DENABLE_NEON=ON \
    -DENABLE_PRECOMPILED_HEADERS=OFF \
    -DCMAKE_SKIP_RPATH=ON \
    -DOPENCV_GENERATE_PKGCONFIG=ON \
    -DPYTHON3_NUMPY_INCLUDE_DIRS=${STAGING_LIBDIR}/python3.8/site-packages/numpy/core/include \
    -DCMAKE_CXX_FLAGS='-Wno-deprecated-copy -Wno-error=deprecated-copy' \
"

PACKAGES += "python3-${PN}"
FILES_python3-${PN} = "${libdir}/python3*/site-packages/*"
FILES_${PN} += "${libdir}/libopencv*.so.*"
FILES_${PN}-dev += "${libdir}/libopencv*.so ${includedir}"
