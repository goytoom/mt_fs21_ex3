# Changes

- Old scripts are located under `scripts/old` and have not been altered
- New scripts are located under `scripts/new` and have been slightly adapted to create the new data, preprocess and train the model
	- Get Data:
		- `download_data_new.sh` extracts the data from the folder in the repo, preprocesses it and prepares the train/test/val split according to the original scripts. An additional script to extract the segments from the folder and save them as one .txt file has been created and included in the bash script.
	- Training
		- epoch: 30
		- emsize: 256
		- nhid: 256
		- dropout: 0, 0.2, 0.4, 0.6, 0.8
		- Training script will train all 5 models consecutively
	- Generating reviews:
		- `generate_new.sh` has been modified to create the samples for all 5 trained models.

- Alternative scripts that use only positive reviews are under `scripts/pos`
- The necessary data (compressed) has been added to the repo, because there have been problems with the download link.


# Work flow

Follow the instructions of the original fork to set the system up.<br>
To create the data use:

`./scripts/new/download_data_new.sh`

To train the model use:

`./scripts/new/train_new.sh`

To generate reviews use:

`./scripts/new/generate_new.sh`

- Edited directory names

# Task 1

I used a dataset containing movie reviews (positive and negative).
I combine both sentiments because I am interested whether the model can be trained to create somewhat realistic reviews.
I am especially interested if the model can also generate reviews that are partially praising a movie but also criticising other aspects of it.
Basically, I am interested how easy it is to create fake reviews automatically and if it is also positive to change the degree of sentiment (pos -> partial -> negative).

The results of the dropout optimisation are, for training: 

| Training perplexity  | Dropout 0 | Dropout 0.2 | Dropout 0.4 | Dropout 0.6 | Dropout 0.8 |
| ------------- | ------------- |------------- |------------- |------------- |------------- |
| 01 | 675.51 | 691.96 | 687.33 | 684.52 | 730.77 |
| 02 | 300.65 | 308.50 | 322.61 | 347.32 | 411.76 |
| 03 | 216.68 | 231.00 | 249.15 | 278.79 | 356.08 |
| 04 | 170.88 | 188.85 | 208.88 | 244.26 | 327.03 |
| 05 | 139.55 | 160.08 | 183.62 | 221.33 | 309.47 |
| 06 | 113.20 | 138.06 | 164.63 | 204.85 | 297.30 |
| 07 | 77.55 | 119.14 | 149.44 | 192.48 | 288.44 |
| 08 | 65.94 | 102.98 | 136.59 | 183.15 | 281.45 |
| 09 | 57.31 | 78.33 | 125.58 | 174.91 | 277.06 |
| 10 | 54.59 | 70.70 | 116.19 | 168.19 | 272.35 |
| 11 | 53.65 | 64.43 | 108.56 | 162.20 | 267.31 |
| 12 | 53.35 | 62.17 | 90.36 | 156.98 | 262.67 |
| 13 | 53.27 | 61.59 | 84.70 | 151.48 | 260.03 |
| 14 | 53.25 | 61.49 | 81.21 | 147.58 | 257.06 |
| 15 | 53.25 | 61.44 | 77.04 | 143.70 | 253.72 |
| 16 | 53.25 | 61.36 | 75.67 | 130.04 | 252.04 |
| 17 | 53.25 | 61.37 | 74.27 | 123.96 | 250.19 |
| 18 | 53.25 | 61.48 | 74.12 | 121.36 | 248.14 |
| 19 | 53.25 | 61.41 | 73.97 | 119.30 | 234.93 |
| 20 | 53.25 | 61.54 | 73.77 | 115.06 | 226.16 |
| 21 | 53.25 | 61.37 | 73.99 | 114.19 | 222.32 |
| 22 | 53.25 | 61.25 | 73.59 | 113.30 | 220.03 |
| 23 | 53.25 | 61.48 | 73.52 | 112.56 | 216.78 |
| 24 | 53.25 | 61.25 | 73.46 | 111.46 | 215.95 |
| 25 | 53.25 | 61.38 | 73.56 | 111.25 | 213.89 |
| 26 | 53.25 | 61.34 | 73.62 | 110.77 | 211.66 |
| 27 | 53.25 | 61.44 | 73.61 | 109.84 | 210.36 |
| 28 | 53.25 | 61.42 | 73.46 | 109.39 | 208.48 |
| 29 | 53.25 | 61.43 | 73.67 | 110.04 | 207.48 |
| 30 | 53.25 | 61.23 | 73.37 | 109.27 | 205.67 |

![training_all.png](https://github.com/goytoom/mt_fs21_ex3/blob/main/Images/training_all.png)

Validation:

| Valid. perplexity  | Dropout 0 | Dropout 0.2 | Dropout 0.4 | Dropout 0.6 | Dropout 0.8 |
| ------------- | ------------- |------------- |------------- |------------- |------------- |
| 01 | 345.77 | 344.34 | 354.05 | 351.48 | 377.94 |
| 02 | 256.00 | 264.79 | 258.34 | 266.26 | 314.85 |
| 03 | 214.80 | 217.39 | 215.69 | 230.83 | 277.53 |
| 04 | 200.39 | 193.86 | 199.47 | 208.91 | 262.69 |
| 05 | 191.49 | 185.90 | 184.28 | 197.17 | 251.63 |
| 06 | 194.20 | 180.15 | 177.93 | 190.25 | 244.85 |
| 07 | 184.33 | 176.39 | 172.48 | 182.47 | 239.17 |
| 08 | 191.87 | 179.11 | 168.85 | 177.62 | 235.02 |
| 09 | 192.62 | 168.66 | 166.67 | 174.55 | 230.38 |
| 10 | 192.13 | 171.63 | 164.94 | 171.54 | 225.99 |
| 11 | 191.13 | 170.13 | 165.98 | 170.26 | 223.49 |
| 12 | 190.81 | 169.67 | 158.17 | 167.93 | 220.19 |
| 13 | 190.73 | 169.38 | 157.90 | 165.49 | 217.94 |
| 14 | 190.71 | 169.29 | 158.96 | 163.94 | 216.55 |
| 15 | 190.71 | 169.27 | 157.88 | 164.80 | 215.54 |
| 16 | 190.70 | 169.26 | 158.37 | 158.59 | 212.47 |
| 17 | 190.70 | 169.26 | 157.97 | 158.12 | 211.37 |
| 18 | 190.70 | 169.26 | 157.80 | 157.77 | 211.42 |
| 19 | 190.70 | 169.26 | 157.75 | 157.88 | 205.83 |
| 20 | 190.70 | 169.26 | 157.65 | 156.50 | 204.15 |
| 21 | 190.70 | 169.26 | 157.66 | 156.45 | 203.04 |
| 22 | 190.70 | 169.26 | 157.65 | 156.25 | 201.48 |
| 23 | 190.70 | 169.26 | 157.63 | 156.22 | 200.74 |
| 24 | 190.70 | 169.26 | 157.62 | 156.13 | 200.18 |
| 25 | 190.70 | 169.26 | 157.62 | 156.16 | 199.29 |
| 26 | 190.70 | 169.26 | 157.61 | 155.97 | 198.69 |
| 27 | 190.70 | 169.26 | 157.61 | 156.03 | 197.87 |
| 28 | 190.70 | 169.26 | 157.60 | 156.01 | 197.43 |
| 29 | 190.70 | 169.26 | 157.60 | 155.99 | 196.53 |
| 30 | 190.70 | 169.26 | 157.60 | 155.99 | 196.09 |

![validation_all.png](https://github.com/goytoom/mt_fs21_ex3/blob/main/Images/validation_all.png)

Testing:

| Testing perplexity  | Dropout 0 | Dropout 0.2 | Dropout 0.4 | Dropout 0.6 | Dropout 0.8 |
| ------------- | ------------- |------------- |------------- |------------- |------------- |
| 01 | 193.01 | 176.27 | 163.10 | 161.86 | 203.50 |

# Conclusions
From the tables and plots, it shows that for a higher dropout we achieve a lower training performance, indicating overfitting for lower dropouts or underfitting for higher dropouts.
The validation tables and plots show that in fact, the lower dropouts (0, 0.2) seem to overfit and thus achieve lower validation performance while the highest dropout (0.8) seem to underfit and also achieves a lower validation performance.
Finally the test performance shows the best performances for 0.6 (followed closely by 0.4), confirming the previous suspicions.
We therefore choose 0.6 as our dropout.

An example sample:

`the characters is entertained unintentional in its characters and defines snooze discover watch , the waydowntown fail
party and young worn purposeful of qui . <eos>`

This does not look convincing. It resembles a review in someway, but does not achieve enough coherence. It starts promising but especially the middle part looses fluency.
I suspect that this is due to a mixture of positive and negative reviews. Notice, the beginning "the character is entertained unintentional" and the middle part "defines snooze". These fragments seem to be taken from positive and negative reviews in the training data respectively.

I also conducted a quick test with only positive reviews and these results (while still not exceptional) looked more promising:
`` that stands by acting <unk> , and sure those of -- he <unk> a charming way .``
It still does not produce a convincing review, however the sentences at least do not flip the sentiment over and over again through out the sentence.
The performances were also better for this model (test ppl = 120).
