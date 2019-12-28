# coding: utf-8

# https://github.com/pandas-dev/pandas/issues/18301
# pandas register error and a solution is described in this page

# no display for matplotlib
import matplotlib as mpl
mpl.use('Agg')

import datetime as dt
import pandas as pd
import matplotlib.pyplot as plt
import matplotlib.dates as mdates
import sys

theFolder=sys.argv[1]
watchRecord=pd.read_csv(theFolder+"watchRecord.csv")

dates=watchRecord['Date'].tolist()
x = [dt.datetime.strptime(d,'%Y-%m-%d').date() for d in dates]
y=watchRecord['Number'].tolist()

plt.gca().xaxis.set_major_formatter(mdates.DateFormatter('%d/%m/%Y'))
#plt.gca().xaxis.set_major_locator(mdates.DayLocator())
plt.plot(x,y)
plt.gcf().autofmt_xdate()
#plt.show()
plt.savefig(theFolder+"watchGraph.pdf",bbox_inches='tight')
