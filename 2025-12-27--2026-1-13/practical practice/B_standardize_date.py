import pandas as pd
import numpy as np

def standardize_date(df, date_col="date"):
    """
    standardize_date 的 Docstring
    
    :param df: 说明待清洗df
    :param date_col: 说明日期列
    """
    #统一日期类型
    df_clean = df.copy()
    df_clean[date_col] = pd.to_datetime(df_clean[date_col], errors='coerce')

    #剔除无效日期
    invalid_date_count = df_clean[date_col].isnull().sum()
    if invalid_date_count > 0:
        print(f"剔除无效日期记录 {invalid_date_count} 条")
        df_clean = df_clean.dropna(subset=[date_col])
    
    #日期升序并重置索引
    df_clean = df_clean.sort_values(by=date_col, ascending=True).reset_index(drop=True)

    #剔除重复日期
    duplicate_date_count = df_clean[date_col].duplicated().sum()
    if duplicate_date_count > 0:
        print(f"剔除重复日期 {duplicate_date_count} 条")
        df_clean = df_clean.drop_duplicates(subset=[date_col], keep='first')

    #剔除非交易日
    df_clean['Week'] = df_clean[date_col].dt.dayofweek
    non_trading_day_count = df_clean[df_clean['Week'] >= 5].shape[0]
    if non_trading_day_count > 0:
        print(f"剔除非交易日记录 {non_trading_day_count} 条") 
        df_clean = df_clean[df_clean['Week'] < 5].reset.index(drop=True)
    df_clean = df_clean.drop(columns=['Week'])

    print(f"日期已标准化 剩余数据 {df_clean.shape[0]}条")
    return df_clean