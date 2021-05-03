#! /bin/bash

scripts=`dirname "$0"`
base=$(realpath $scripts/../..)

models=$base/models
data=$base/data
tools=$base/tools
samples=$base/samples

mkdir -p $samples

num_threads=12
device=0

(cd $tools/pytorch-examples/word_language_model &&
    CUDA_VISIBLE_DEVICES=$device OMP_NUM_THREADS=$num_threads python generate.py \
        --data $data/interesting \
        --words 100 \
        --checkpoint $models/model_1.pt \
        --outf $samples/sample_1.txt
		
)

(cd $tools/pytorch-examples/word_language_model &&
    CUDA_VISIBLE_DEVICES=$device OMP_NUM_THREADS=$num_threads python generate.py \
        --data $data/interesting \
        --words 100 \
        --checkpoint $models/model_2.pt \
        --outf $samples/sample_2.txt
		
)

(cd $tools/pytorch-examples/word_language_model &&
    CUDA_VISIBLE_DEVICES=$device OMP_NUM_THREADS=$num_threads python generate.py \
        --data $data/interesting \
        --words 100 \
        --checkpoint $models/model_3.pt \
        --outf $samples/sample_3.txt
		
)

(cd $tools/pytorch-examples/word_language_model &&
    CUDA_VISIBLE_DEVICES=$device OMP_NUM_THREADS=$num_threads python generate.py \
        --data $data/interesting \
        --words 100 \
        --checkpoint $models/model_4.pt \
        --outf $samples/sample_4.txt
		
)

(cd $tools/pytorch-examples/word_language_model &&
    CUDA_VISIBLE_DEVICES=$device OMP_NUM_THREADS=$num_threads python generate.py \
        --data $data/interesting \
        --words 100 \
        --checkpoint $models/model_5.pt \
        --outf $samples/sample_5.txt
		
)