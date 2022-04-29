import sys
import matplotlib.pyplot as plt
import pandas as pd

#fl = sys.argv[1]
fl ='data.csv'
print(fl)

df = pd.read_csv(fl, sep='  ', delimiter=None, names=('L', 'exp', 'imp', 'Analytic'))
#print(df)
#df.columns = ['L', 'exp', 'imp', 'analytic']

#print(df.iloc[:,0])

#pause
plt.plot(df.iloc[:,0], df.iloc[:,1], '-go', label='Explicit')
plt.plot(df.iloc[:,0], df.iloc[:,2], 'b*', label='Implicit')
plt.plot(df.iloc[:,0], df.iloc[:,3], 'gs', label='Analytic')

plt.title('A convection diffusion equation solver')
plt.xlabel('Length')
plt.ylabel('Concentration')
plt.legend(loc='best')  # legend text comes from the plot's label parameter.
plt.savefig('data.png')

