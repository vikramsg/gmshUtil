import numpy as np 
import re

file_read  = 'channel_u1.msh'
file_write = 'channel_e1.msh'

nx = 24
ny = 12
nz = 12

lx = 2*np.pi 
ly = 2
lz = np.pi 

gamma = 1.5 

def read(infile):
    op = open(infile, 'r')

    lns = op.readlines()

    op.close()

    return lns

def mod(lns, outfile):

    new_lns = lns

    for it, i in enumerate(lns):
        if re.search('Nodes', i) is not None:
            break

    num_lines = int(lns[it + 1])

    start = it + 2
    for it, i in enumerate(lns[start:start + num_lines]):
#    for it, i in enumerate(lns[start:start + 60]):
        ln = i.split()
        x  = float(ln[1])
        y  = float(ln[2])
        z  = float(ln[3])

        new_y   = None
        for j in range( 1, ny ):
            comp_y = (j*ly/ny)
            if ( ( np.abs(y - comp_y ) < 1E-10) ): 
                new_y  = 1 - np.tanh(gamma*(1 - comp_y))/np.tanh(gamma)

        if new_y is not None:
            new_lns[start + it] = ln[0] + "\t" + ln[1] + "\t" + str(new_y) + "\t" + ln[3] + "\n"

    wr = open(outfile, 'w')

    for i in new_lns:
        wr.write(i)

    wr.close()



if __name__ == "__main__":
    lns = read(file_read)

    mod(lns, file_write)
