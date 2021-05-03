#! /bin/bash
scripts=`dirname "$0"`
base=$scripts/../..
data=$base/data
mkdir -p $data
tools=$base/tools

# link default training data for easier access
mkdir -p $data/interesting

# download a different interesting data set!
mkdir -p $data/interesting/raw
tar -xvzf rt-polaritydata.tar.gz

python $base/scripts/new/get_data.py

mv $data/reviews.txt $data/interesting/raw

# preprocess slightly

cat $data/interesting/raw/reviews.txt | python $base/scripts/new/preprocess_raw.py > $data/interesting/raw/reviews.cleaned.txt

# tokenize, fix vocabulary upper bound

cat $data/interesting/raw/reviews.cleaned.txt | python $base/scripts/new/preprocess.py --vocab-size 10000 --tokenize --lang "en" > \
    $data/interesting/raw/reviews.preprocessed.txt

# split into train, valid and test

head -n 1000 $data/interesting/raw/reviews.preprocessed.txt > $data/interesting/valid.txt
head -n 3202 $data/interesting/raw/reviews.preprocessed.txt | tail -n 2202 > $data/interesting/test.txt
tail -n 7460 $data/interesting/raw/reviews.preprocessed.txt > $data/interesting/train.txt