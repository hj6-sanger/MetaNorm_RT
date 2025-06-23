#Position weight matrix generated using PCAWG data
#	A	C	G	T
#1	0.844064263	0.013796909	0.081003189	0.061135639
#2	0.023546726	0.139931322	0.076649497	0.759872455
#3	0.855898945	0.010363012	0.105040471	0.028697572
#5	0.832045622	0.021155261	0.094186902	0.052612215
#4	0.728108904	0.023730684	0.197142507	0.051017905


library(Biostrings)
library(BSgenome.Hsapiens.UCSC.hg38)





import random
import numpy as np
f=open('dup_intersect_repeatmasker.txt')
fline = f.readline()
a=[]
while fline :
        fline = fline.strip()
        fso = fline.split('\t')
        a.append(float(fso[7]))
        fline = f.readline()
f.close()

b=random.sample(a,1403)
g=open('simul_out.txt','w')

i=1
while i < 10000 :
        b=random.sample(a,1403)
        g.write(str(np.mean(b)) + '\n')
        i=i+1
g.close()


