#! /bin/bash
scripts=`dirname "$0"`
base=$scripts/../..
data=$base/data
mkdir -p $data
tools=$base/tools

# link default training data for easier access
mkdir -p $data/positive

# download a different interesting data set!
mkdir -p $data/positive/raw
tar -xvzf rt-polaritydata.tar.gz

python $base/scripts/pos/get_data_pos.py

mv $data/postive_reviews.txt $data/positive/raw

# preprocess slightly

cat $data/positive/raw/postive_reviews.txt | python $base/scripts/pos/preprocess_raw.py > $data/positive/raw/reviews.cleaned_pos.txt

# tokenize, fix vocabulary upper bound

cat $data/positive/raw/reviews.cleaned_pos.txt | python $base/scripts/pos/preprocess.py --vocab-size 5000 --tokenize --lang "en" > \
    $data/positive/raw/reviews.preprocessed_pos.txt

# split into train, valid and test

head -n 800 $data/positive/raw/reviews.preprocessed_pos.txt > $data/positive/valid.txt
head -n 1600 $data/positive/raw/reviews.preprocessed_pos.txt | tail -n 800 > $data/positive/test.txt
tail -n 3731 $data/positive/raw/reviews.preprocessed_pos.txt > $data/positive/train.txt