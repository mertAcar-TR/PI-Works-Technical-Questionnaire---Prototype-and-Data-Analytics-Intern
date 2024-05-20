#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Mon May 20 03:02:57 2024

@author: mertacar
"""

import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
df=pd.read_csv("country_vaccination_stats.csv")
ornek_df=df[df["daily_vaccinations"].isna()]
def calculateDailyVaccinations(country):
    min_value=df[df["country"]==country]["daily_vaccinations"].min()
    return min_value
new_values=ornek_df["country"].apply(lambda x:calculateDailyVaccinations(x)).fillna(0)
df["daily_vaccinations"].fillna(new_values,inplace=True)