import pandas as pd
import numpy as np

def load_market_data(file_path):
    """
    加载个股行情数据,判断是否为csv/excel,返回df
   
    """
    if file_path.endswith('.csv'):
        df = pd.read_csv(file_path, keep_default_na=True)
    elif file_path.endswith('.xlsx') or file_path.endswith('.xls'):
        df = pd.read_excel(file_path, sheet_name=0, keep_default_na=True)
    else:
        raise ValueError("仅支持csv和excel")

    core_columns = ['date','open','high','low','close','volume']
    #检查是否缺失列
    df_columns_lower = df.columns.str.lower()
    missing_cols = [col for col in core_columns if col.lower() not in df_columns_lower]
    if missing_cols:
        print(f'缺失列:{missing_cols}')
    else:
        print('所有列均存在')

    print("\n" + "="*60 + " 数据试探结果 " + "="*60)
    print(f"1.数据规模:总行数 {df.shape[0]}, 总列数 {df.shape[1]}")
    print(f"2.各列数据类型:{df.dtypes}")
    print(f"3.前5行数据:{df.head()}")
    print(f"4.后5行数据:{df.tail()}")
    print(f"5.各列缺失值:{df.isna().sum()}")
    print("="*60 + " 数据初探结束 " + "="*60 + "\n")

    return df