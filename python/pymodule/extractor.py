'''
This scripts is used for parsing Gaussian files
'''

import numpy as np
from operator import methodcaller

gasC = 1.9872036
bltzC = 3.2976230e-24
bltzCinJ = 1.38064852e-23
plckCinJ = 6.62607004e-34

class glog():
    def __init__(self, file):
        self.f = file

    @property
    def entropy(self):
        with open(self.f, 'r') as f:
            s = next(filter(methodcaller('startswith',
                ' Total  '),f.readlines())).split()[3]
        return float(s)

    @property
    def enthapy(self):
        with open(self.f, 'r') as f:
            h = next(filter(methodcaller('startswith',
                ' Sum of electronic and thermal Enthalpies='),
                f.readlines())).split('=')[1].strip()
        return float(h) * 627.509

def eyring_with_temp(T, dh, ds):
    return bltzCinJ * T / plckCinJ\
            * np.exp(ds / gasC)\
            * np.exp(-dh / (gasC/1000 * T))

def eyring(dh,ds):
    return eyring_with_temp(300., dh, ds)
