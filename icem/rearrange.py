import numpy as np

class Rearrange:

    def rearrange(self, fileName, upperSurLines, outFile):
        op = open(fileName, 'r')
        l1 = []; l2 = []
        for i, line in enumerate(op.readlines()):
            if i <= upperSurLines:
                l1.append(line)
            else:
                l2.append(line)
        op.close()
        op = open(outFile, 'w')
        st = str(int(upperSurLines)*2)+'\t'+'2\n'
        op.write(st)
        for i in range(upperSurLines):
            st = ''
            line = l1[upperSurLines - i - 1]
            for j in line.split():
                st += str(j) + '\t'
            st += '\t0.0\n'
            op.write(st)
#        op.write('0.0\t0.0\t0.0\n')
        for i in l2:
            st = ''
            for j in i.split():
                st += str(j) + '\t'
            st += '\t0.0\n'
            op.write(st)

        op.close()

if __name__=="__main__":
    run = Rearrange()
    run.rearrange(fileName = 'sd7003.dat', upperSurLines = 32, outFile = 'formatSD7003.dat')


