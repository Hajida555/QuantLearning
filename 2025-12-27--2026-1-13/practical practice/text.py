from F_full_market_data_cleaning import  full_market_data_cleaning
 
df_cleaned = full_market_data_cleaning(
    raw_file_path="A_share_Raw_Data\\sh_600519_raw_daily_data.csv",
    save_file_path="cleaned_data/sh_600519_raw_daily_data",
    save_format="csv",
    date_col="date",
)
