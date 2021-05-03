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
    CUDA_VISIBLE_DEVICES=$device OMP_NUM_THREADS=$num_threads python main.py --data $data/positive \
        --epochs 25 \
        --emsize 200 --nhid 200 --dropout 0.5 --tied \
        --save $models/model_pos.pt
)

echo "time taken:"
echo "$SECONDS seconds"