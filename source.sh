export HOLO_ROOT=~/$1/output/native/relwithdebinfo/target/
export LD_LIBRARY_PATH=${HOLO_ROOT}/3rdparty/lib:${HOLO_ROOT}/lib/:${LD_LIBRARY_PATH}

export TENSORFLOW_BUILD_PATH=/opt/holo/tensorflow
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/holo/tensorflow/bazel-bin/tensorflow
