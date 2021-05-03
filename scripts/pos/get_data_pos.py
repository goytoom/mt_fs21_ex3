# -*- coding: utf-8 -*-
"""
Created on Sun May  2 18:57:47 2021

@author: suhai
"""

import argparse
import random
random.seed(0)

parser = argparse.ArgumentParser(description='MT EX03 - getData')

# Model parameters.
parser.add_argument('--data', type=str, default='./rt-polaritydata',
                    help='location of the data corpus')
args = parser.parse_args()

#positives
with open(args.data +"/rt-polarity.pos", 'r', encoding='utf-8', errors='replace')as f:
    pos = f.readlines() #List with every line a segment! (one sentence a segment)
    
#mix both up

random.shuffle(pos)

# save as text file
with open("./data/postive_reviews.txt", 'w', encoding="utf-8", errors='replace') as f:
    for line in pos:
        f.write(line+"\n")