#!/usr/bin/env python
# coding: utf-8

# In[1]:


# Import libraries

import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns


# In[2]:


# Check the current working directory

import os

os.getcwd()


# In[3]:


# Set the working directory

os.chdir(r"C:\Users\miked\Desktop\Documents\Data Analysis Projects\Retail Sales SQL Analysis\dataset")


# In[4]:


# Load the dataset

mydata = pd.read_csv(r"C:\Users\miked\Desktop\Documents\Data Analysis Projects\Retail Sales SQL Analysis\dataset\online_retail.csv",
                     encoding="latin1")


# In[5]:


# Inspect the dataset structure

mydata.info()


# In[6]:


# Display the head of the dataset

mydata.head(5)


# In[7]:


# Rename columns for convenience

mydata = mydata.rename(columns={
    'InvoiceNo': 'order_id',
    'StockCode': 'product_code',
    'Description': 'product_name',
    'Quantity': 'quantity',
    'InvoiceDate': 'order_date',
    'UnitPrice': 'unit_price',
    'CustomerID': 'customer_id',
    'Country': 'country'
})


# In[8]:


# Convert the date column to the datetime format

mydata['order_date'] = pd.to_datetime(mydata['order_date'])


# In[9]:


# Convert the customer ID column to the integer format

mydata['customer_id'] = mydata['customer_id'].astype("Int64")


# In[10]:


# Display rows with missing values

mydata[mydata.isna().any(axis=1)]


# In[11]:


# Count missing values in each column

mydata.isna().sum()


# In[12]:


# Calculate missing value percentages per column to understand impact of removal

(mydata.isna().sum() / len(mydata) * 100).round(2)


# In[13]:


# Inspect rows with missing values in product name column

mydata[mydata['product_name'].isna()]


# In[14]:


# Drop missing values from product name column

mydata = mydata.dropna(subset=['product_name'])


# In[15]:


# Count duplicate entries

mydata.duplicated().sum()


# In[16]:


# Inspect duplicate entries to verify whether they are duplicates

mydata[mydata.duplicated(keep=False)].head(20)


# In[17]:


# Remove duplicate entries

mydata = mydata.drop_duplicates()


# In[18]:


# Count rows with 0 or negative quantity values

(mydata['quantity'] <= 0).sum()


# In[19]:


# Remove rows with invalid quantity values

negative_quantity = mydata[mydata['quantity'] <= 0]

mydata = mydata.drop(negative_quantity.index)


# In[20]:


# Count rows with 0 or negative price values

(mydata['unit_price'] <= 0).sum()


# In[21]:


# Remove rows with invalid price values

negative_price = mydata[mydata['unit_price'] <= 0]

mydata = mydata.drop(negative_price.index)


# In[22]:


# Identify cancelled orders

mydata[mydata['order_id'].str.startswith('C', na=False)]


# In[32]:


# Check for remaining alphabetic order IDs

mydata[mydata['order_id'].str.contains('[A-Za-z]', na=False)]


# In[31]:


row_remove = mydata[mydata['order_id'].str.contains('[A-Za-z]', na=False)]

mydata = mydata.drop(row_remove.index)


# In[23]:


# Create year column of out date column

mydata['year'] = mydata['order_date'].dt.year


# In[24]:


# Create month column of out date column

mydata['month'] = mydata['order_date'].dt.month


# In[25]:


# Create revenue column combining quantity and price

mydata['revenue'] = mydata['quantity'] * mydata['unit_price']


# In[33]:


# Save the cleaned dataset as a csv file

mydata.to_csv("retail_sales_clean.csv", index=False)

