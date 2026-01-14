import pandas as pd
import numpy as np
def remove_outliers(df):
    """
    remove_outliers 的 Docstring
    剔除异常值
    :param df: 说明无异常缺失的df
    """
    if df is None or df.empty:
        raise ValueError("输入为空或None")
    
    df_clean = df.copy()
    price_cols = ['open','high','low','close']
    volume_col = 'volume'

    before_count = df_clean.shape[0]

    #剔除负价格 最高价小于最低价的
    if all(col in df_clean.columns for col in price_cols):
        df_clean = df_clean[df_clean[price_cols].gt(0).all(axis=1)]
    else:
        missing_cols = [col for col in price_cols if col not in df_clean.columns]
        raise KeyboardInterrupt(f"数据缺失列 {missing_cols}")
    
    if len(price_cols) >= 2:
        df_clean = df_clean[df_clean['high'] >= df_clean['close']]
        df_clean = df_clean[(df_clean['close'] >= df_clean['low']) & (df_clean['close'] <= df_clean['high'])]

    #剔除负数成交量
    df_clean = df_clean[df_clean[volume_col].gt(0)]
    explict_outlier = before_count - df_clean.shape[0]
    print(f"剔除异常交易记录 {explict_outlier} 条")

    #剔除隐形异常值
    implicit_outlier_count = 0
    if 'close' in df_clean.columns:
        close_prices = df_clean['close']
        Q1 = close_prices.quantile(0.25)
        Q3 = close_prices.quantile(0.75)
        IQR = Q3 -Q1
        lower_bound = Q1 - 1.5 * IQR
        upper_bound = Q3 + 1.5 * IQR
        df_clean_temp = df_clean[(df_clean['close'] >= lower_bound) & (df_clean['close'] <= upper_bound)]
        implicit_outlier_count = df_clean.shape[0] - df_clean_temp.shape[0]
        df_clean = df_clean_temp.copy()
        print(f"剔除隐性异常值 {implicit_outlier_count} 条")

    print(f"异常值已剔除 剩余 {df_clean.shape[0]} 条")
    return df_clean