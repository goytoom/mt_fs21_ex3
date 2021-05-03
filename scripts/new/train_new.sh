#! /bin/bash

scripts=`dirname "$0"`
base=$(realpath $scripts/../..)

models=$base/models
data=$base/data
tools=$base/tools

mkdir -p $models

num_threads=12
device=0

SECONDS=0

(cd $tools/pytorch-examples/word_language_model &&
    CUDA_VISIBLE_DEVICES=$device OMP_NUM_THREADS=$num_threads python main.py --data $data/interesting \
        --epochs 30 \
        --emsize 256 --nhid 256 --dropout 0.0 --tied \
        --save $models/model_1.pt
)

echo "time taken:"
echo "$SECONDS seconds"


SECONDS=0

(cd $tools/pytorch-examples/word_language_model &&
    CUDA_VISIBLE_DEVICES=$device OMP_NUM_THREADS=$num_threads python main.py --data $data/interesting \
        --epochs 30 \
        --emsize 256 --nhid 256 --dropout 0.2 --tied \
        --save $models/model_2.pt
)

echo "time taken:"
echo "$SECONDS seconds"

SECONDS=0

(cd $tools/pytorch-examples/word_language_model &&
    CUDA_VISIBLE_DEVICES=$device OMP_NUM_THREADS=$num_threads python main.py --data $data/interesting \
        --epochs 30 \
        --emsize 256 --nhid 256 --dropout 0.4 --tied \
        --save $models/model_3.pt
)

echo "time taken:"
echo "$SECONDS seconds"

SECONDS=0

(cd $tools/pytorch-examples/word_language_model &&
    CUDA_VISIBLE_DEVICES=$device OMP_NUM_THREADS=$num_threads python main.py --data $data/interesting \
        --epochs 30 \
        --emsize 256 --nhid 256 --dropout 0.6 --tied \
        --save $models/model_4.pt
)

echo "time taken:"
echo "$SECONDS seconds"

SECONDS=0

(cd $tools/pytorch-examples/word_language_model &&
    CUDA_VISIBLE_DEVICES=$device OMP_NUM_THREADS=$num_threads python main.py --data $data/interesting \
        --epochs 30 \
        --emsize 256 --nhid 256 --dropout 0.8 --tied \
        --save $models/model_5.pt
)

echo "time taken:"
echo "$SECONDS seconds"