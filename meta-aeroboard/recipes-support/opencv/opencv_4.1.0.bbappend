PACKAGECONFIG_remove = "cuda cudnn opencl contrib amdblas amdfft"

EXTRA_OECMAKE_remove = "-DWITH_OPENCL=ON"
EXTRA_OECMAKE_remove = "-DWITH_CUDA=ON"

EXTRA_OECMAKE_append = " \
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
    -DCPU_BASELINE=NEON \
    -DCPU_DISPATCH='' \
    -DENABLE_NEON=ON \
    -DOPENCV_EXTRA_MODULES_PATH='' \
    -DBUILD_opencv_contrib=OFF \
    -DCMAKE_CXX_FLAGS='-Wno-deprecated-copy -Wno-error=deprecated-copy' \
"
