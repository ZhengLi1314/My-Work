"""Title:
- 2021 SSMIF Quant Project - Bollinger Bands

Author:
- Zheng Li

Date:
- 10/17/2020

Filename: 
- Bollinger_Bands.py

Description:
- This project create a Bollinger Bands trading model for MSFT's 
closing price from 2018-01-01 to 2020-09-01.
"""

import pandas as pd
import matplotlib.pyplot as plt
import pandas_datareader as dr
import numpy as np

xasd = 1 + 1
print(xasd)

#Get MSFT data from Yahoo Finance
msft = dr.data.get_data_yahoo('msft', start = '2018-01-01', 
end = '2020-09-01')
msft_Close = msft['Close']
print("\nClosing Price for MSFT from 2018-01-01 to 2020-09-01:")
print(msft_Close)

#Setting the bollinger band period to 20 days
period = 20

#Getting the Middle, Upper, and Lower bands
msft['Mean'] = msft['Close'].rolling(window = period).mean()
msft['Std'] = msft['Close'].rolling(window = period).std()
msft['Upper'] = msft['Mean'] + (msft['Std'] * 2)
msft['Lower'] = msft['Mean'] - (msft['Std'] * 2)

#Combine them in one dataframe
Bmsft = msft[['Close', 'Mean', 'Upper','Lower']]

#Get rid of the NaN values
Bmsft_adjusted = Bmsft[period-1: ]

#Create the action function: whether to buy or sell
def action(data):
    buy = []
    sell = []
    for x in range(len(data['Close'])):
        if data['Close'][x] < data['Lower'][x]: #when to buy
            buy.append(data['Close'][x])
            sell.append(np.nan)
        elif data['Close'][x] > data['Upper'][x]: #when to sell
            sell.append(data['Close'][x])
            buy.append(np.nan)
        else:
            buy.append(np.nan)
            sell.append(np.nan)
    return(buy, sell)

Bmsft_adjusted['Buy'] = action(Bmsft_adjusted)[0]
Bmsft_adjusted['Sell'] = action(Bmsft_adjusted)[1]

#Creating the trading entry
Date = []
Price = []
Action = ['1']
Cum_Returns = []

#get all the data from Date, Price, and Action
for x in range(len(Bmsft_adjusted['Close'])):
    if (Bmsft_adjusted['Buy'][x] > 0) and (Action[-1] != 'Buy'):
        Date.append(Bmsft_adjusted.index[x])
        Price.append(round(Bmsft_adjusted['Close'][x],3))
        Action.append('Buy')
    elif (Bmsft_adjusted['Sell'][x] > 0) and (Action[-1] != 'Sell'):
        Date.append(Bmsft_adjusted.index[x])
        Price.append(round(Bmsft_adjusted['Close'][x],3))
        Action.append('Sell')
Action.pop(0)

#get the data for Cum_Returns
for x in range(len(Date)):
    Cum_Returns.append(round(((Price[x] - Price[0]) / Price[0]*100), 3))

#putting Date, Price, Action, and Cum_Returns together and print
t = {"Price $": Price, "Action": Action, "Cum Returns %": Cum_Returns}
trade = pd.DataFrame(data = t, index = Date)
print("\nTrade entry:")
print(trade)

#Calculating the overall standard deviation of MSFT Closing price in the 
#given time period
msft_std = np.std(msft_Close)
print('\n')
print("The standard deviation is", round(msft_std, 3))

#Calculating the daily std of MSFT Closing price in the given time period
msft_dstd = msft_Close.rolling(window = 2).std()
print('\n')
print(msft_dstd)

#Calculating the annual std of MSFT Closing price for 2018 and 2019.

std_2018 = np.std(msft_Close['2018-01-01':'2018-12-31'])
std_2019 = np.std(msft_Close['2019-01-01':'2019-12-31'])

print("\nAnnul standard deviation for 2018 is", std_2018)
print("Annul standard deviation for 2019 is", std_2019)


#Calculation the return of the portfolio in the  time period
print('\n')
print("The net return of the portfolio is",  Cum_Returns[-1], "%")


#Create a visualization of the closing price overlaid with the Bollinger Bands

Bmsft_adjusted.plot()
plt.title('Bollinger Band for MSFT (Period: 20 days)')
plt.ylabel('Price $')
plt.scatter(Bmsft_adjusted.index, Bmsft_adjusted['Buy'], 
color = 'green', lw = 4, marker = '^')
plt.scatter(Bmsft_adjusted.index, Bmsft_adjusted['Sell'], 
color = 'red', lw = 4, marker = 'v')
plt.plot(Bmsft_adjusted.index, Bmsft_adjusted['Upper'], 
color = 'black',)
plt.plot(Bmsft_adjusted.index, Bmsft_adjusted['Lower'], 
color = 'black',)
plt.show()

