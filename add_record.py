# coding: utf-8

from datetime import date
import pandas as pd
import requests
import re
import sys

theFolder=sys.argv[1]
theList=theFolder+"watchRecord.csv"
titles=['Date','Number']
page = requests.get('https://letterboxd.com/gapolinario/watchlist/')
match=re.search('to see (\d+)\&nbsp',page.text)
num=int(match.group(1))
watchRecord=pd.read_csv(theList)
today=pd.DataFrame([dict(zip(titles,[date.today(),num]))], columns=titles)
watchRecord=watchRecord.append(today,ignore_index=True)
watchRecord.style
watchRecord.to_csv(theList,index=False)