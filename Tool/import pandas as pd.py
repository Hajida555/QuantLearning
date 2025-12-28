import pandas as pd
import os
import baostock as bs
#固定保存路径并自动创建文件夹
A_share_Raw_Data = "D:/quant-learning/quant-learning-git/raw_data"
save_root = A_share_Raw_Data #可改文件名
os.makedirs(save_root, exist_ok=True)#创建文件夹
#选择三只股票和时间
stock_list = [
    "sh.600519",
    "sz.000001",
    "sh.601318"
]
start_data = "2024-12-25"
end_data = "2025-12-25"
#登录Baostock
lg = bs.login()
#获取数据并保存为csv文件
if lg.error_msg != "success":
    print(f"登录失败: {lg.error_msg}")#判断是否登陆成功 失败则停止
else:
    print("Baostock登录成功，开始获取股票数据...\n")
    for stock_code in stock_list:#先获取单只股票的日线原始数据                     
        K_data_result = bs.query_history_k_data_plus(
        stock_code=stock_code,#参数1：股票代码
        fields="data,open,high,low,close,volume",#参数2：日期 开高底收 成交量
        start_date=start_data,#参数3：开始日期
        end_date=end_data,#参数4：结束日期
        frequency="d",#参数5：k线类型 d=日线
        adjustflag="3"#参数6：复权类型 3=不复权
        )

    #将数据转换为DataFrame并保存为csv文件
    stock_df = K_data_result.get_data()
            
    #处理文件名称
    