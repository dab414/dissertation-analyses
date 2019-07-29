#!/home/dave/anaconda2/bin/python

import pandas as pd

d = pd.read_csv('../data/demo.csv')

for h in d['comments']:
  print str(h) + '\n\n'