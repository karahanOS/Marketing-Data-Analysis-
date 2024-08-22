import pandas as pd
import numpy as np
import seaborn as sns
import matplotlib.pyplot as plt

df_customer = pd.read_csv(r'C:\Users\Karahan C\Desktop\Portfolio Projects\MARKETING\CSV FILES\DIM_Customer.csv')
df_product = pd.read_csv(r'C:\Users\Karahan C\Desktop\Portfolio Projects\MARKETING\CSV FILES\DIM_Product.csv')
df_customerJourney = pd.read_csv(
    r'C:\Users\Karahan C\Desktop\Portfolio Projects\MARKETING\CSV FILES\FACT_CustomerJourney.csv')
df_engagementDate = pd.read_csv(
    r'C:\Users\Karahan C\Desktop\Portfolio Projects\MARKETING\CSV FILES\FACT_EngagementData.csv')
df_reviews = pd.read_csv(r'C:\Users\Karahan C\Desktop\Portfolio Projects\MARKETING\CSV FILES\FACT_Reviews.csv')

df_merged = pd.merge(df_customerJourney, df_product, on='ProductID', how='left')


# Average Order Value calculated 
total_transaction = (df_merged[df_merged['Action'] == 'Purchase']['Price'].sum())
transaction_count = (df_merged[df_merged['Action'] == 'Purchase']['Price'].count())
AOV = (total_transaction / transaction_count)
print(AOV)

