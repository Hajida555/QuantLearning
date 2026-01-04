import pandas as pd
import os
import baostock as bs

# 固定保存路径并自动创建文件夹
A_share_Raw_Data = "D:\\quant-learning\\quant-learning-git\\2025-12-pandas and math\\practical practice\\A_share_Raw_Data"
save_root = A_share_Raw_Data  # 可改文件名
os.makedirs(save_root, exist_ok=True)  # 创建文件夹（已存在则不报错）

# 选择单只股票（直接指定单个股票代码，无需列表）
single_stock_code = "sh.600519"  # 可替换为 sz.000001 或 sh.601318
start_date = "2024-10-25"
end_date = "2025-10-25"

# 登录Baostock
lg = bs.login()

# 获取单只股票数据并保存为csv文件
if lg.error_msg != "success":
    print(f"登录失败: {lg.error_msg}")  # 判断是否登陆成功 失败则停止
else:
    print("Baostock登录成功，开始获取单只股票数据...\n")
    # 直接获取该单只股票的日线原始数据（无需for循环遍历）
    K_data_result = bs.query_history_k_data_plus(
        single_stock_code,  # 参数1：单只股票代码
        fields="date,open,high,low,close,volume",  # 参数2：日期 开高底收 成交量
        start_date=start_date,  # 参数3：开始日期
        end_date=end_date,  # 参数4：结束日期
        frequency="d",  # 参数5：k线类型 d=日线
        adjustflag="3"  # 参数6：复权类型 3=不复权
    )
    stock_df = K_data_result.get_data()  # 将数据转换为DataFrame

    # 处理文件名称（避免小数点在文件名中产生问题）
    safe_stock_code = single_stock_code.replace(".", "_")
    file_name = f"{safe_stock_code}_raw_daily_data.csv"  # 生成文件名称
    full_save_path = os.path.join(save_root, file_name)  # 拼接完整保存路径（兼容不同系统）

    # 保存为csv文件（不保存索引列）
    stock_df.to_csv(full_save_path, index=False)

    # 打印相关信息
    print(f"{single_stock_code} 的日线数据已保存至 {full_save_path}\n")
    print(f"该股票数据行数：{len(stock_df)} 行\n")

    # 登出Baostock
    bs.logout()
    print("单只股票数据获取并保存完成，已登出Baostock。")