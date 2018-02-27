# coding: utf-8

import datetime as dt
import pandas as pd
import numpy as np
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