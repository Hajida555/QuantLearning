import pandas as pd
import numpy

def standardize_date(df, date_col="date"):
    """
    standardize_date 的 Docstring
    
    :param df: 说明待清洗df
    :param date_col: 说明日期列
    """
    #统一日期类型
    df_clean = df.copy()
    df_clean[date_col] = pd.to_datetime(df_clean[date_col], error='coerce')

    #剔除无效日期
    invalid_date_count = df_clean[date_col].isnull().sum()
    if invalid_date_count > 0:
        print(f"剔除无效日期记录 {invalid_date_count} 条")
        df_clean = df_clean.dropna(subset=[date_col])
    
    #
    df_clean = df_clean.sort_values(by=date_col, ascending)