from A_load import  load_market_data
from B_standardize_date import standardize_date
from C_delete_missing_values import delete_missing_values
from D_remove_outliers import remove_outliers
from E_save_cleaned_data import save_cleaned_data

def full_market_data_cleaning(raw_file_path, save_file_path, save_format="csv", date_col="交易日期"):
    """
    个股行情数据全流程清洗串联（适配整合后的加载+初探函数）
    :param raw_file_path: 原始数据文件路径
    :param save_file_path: 清洗后数据保存路径
    :param save_format: 保存格式为csv/excel
    :param date_col: 日期列名
    """
    # 1. 加载数据
    print("="*80)
    print("第一步：加载原始数据")
    df_original = load_market_data(raw_file_path)
    
    # 2. 日期格式标准化
    print("\n" + "="*80)
    print("第二步：日期格式标准化")
    df_date_standard = standardize_date(df_original, date_col=date_col)
    
    # 3. 缺失值删除
    print("\n" + "="*80)
    print("第三步：缺失值删除")
    df_no_missing = delete_missing_values(df_date_standard)
    
    # 4. 异常值剔除
    print("\n" + "="*80)
    print("第四步：异常值剔除")
    df_final = remove_outliers(df_no_missing)

    # 5. 数据保存
    print("\n" + "="*80)
    print("第六步：保存清洗后数据")
    df_final = save_cleaned_data(df_final,save_file_path, file_format=save_format)
    
    return df_final
