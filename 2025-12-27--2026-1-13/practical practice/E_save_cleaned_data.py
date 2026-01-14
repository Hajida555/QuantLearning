import numpy as np
import pandas as pd
def save_cleaned_data(df, save_path, file_format="csv"):
    """
    save_cleaned_data 的 Docstring
    保存清洗后的数据,支持csv/excel
    :param df: 说明清洗后的df
    :param save_path: 说明保存路径
    """
    save_path = 'cleaned_data/sh_600519_raw_daily_data'
    if file_format == "csv":
        df.to_csv(save_path, index=False, encoding='utf-8-sig')
        print(f"数据已保存为csv,路径: {save_path}")
    elif file_format == "excel":
        df.to_excel(save_path, index=False, sheet_name="清洗后数据表")
        print(f"数据已保存为excel,路径: {save_path}")
    else:
        raise ValueError("仅支持csv/excel")
    