import numpy as np 
import pandas as pd
def delete_missing_values(df):
    """
    针对核心列删除缺失值，确保行情数据完整性
    :param df: 日期标准化后的DataFrame
    :return: 无缺失值的DataFrame
    """
    df_clean = df.copy()
    core_columns = ['date','open','high','low','close','volume']
    
    df_clean = df_clean.dropna(subset=core_columns)
    missing_after = df_clean[core_columns].isnull().sum()
    deleted_count = df.shape[0] - df_clean.shape[0]
    
    print(f"共删除缺失值 {deleted_count}")
    print(f"剩余数据 {missing_after}")
    return df_clean