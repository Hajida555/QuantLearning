# 2025
##  12-27
1. 函数应用和映射
  - numpy的函数可以对pandas的对象使用(例如np.abs(DataFrame) or 多个值组成的Series)
  - 并且可以具体使用到行和列中(例如使用DataFrame.**apply**(函数) 默认为列)
  - 对于元素级的Python的函数可以使用**map**
2. 排列和排名（类似sql）
  - sort_index() 对于Series or DataFrame默认按索引排列和升序 降序ascendin=False
  - sort_values() 则是按值排列 当对DataFrame排序时，可以使用一列或多列的的数据作为排序键
  - 任何缺失值都会放到Series的末尾 反过来na_position="first"
  - rank() 为数据的值排名 默认相同的值取平均数(例如 1 2 2.5 2.5)
  - 如果想让rank按原数据中出现的顺序排名 method="first" 这样会从最小值1一直排到底
  - rank的降序也与排列一样 ascendin=False
  - 同样rank可以使用一列或多列的的数据作为排名键
3. 对于带有重复标签的索引的处理
  - 对index使用is_unique可以得知索引是否是唯一的
  - if 索引对应多个值 return Series if 为单个则与平常一样 return 单个值
  - 对DataFrame同样生效
  - 但是上述操作会使代码复杂化
## 12-28
1.  3Blue1Brown学习了指数函数求导和隐函数求导
  - 指数函数在在短时的变化率等于自身乘以一个常数 当底数为e时 常数为一
  - 通过链式法则 推出e^常数*t = 常数^t
  - 当x发生短时变化，y也随之变化 求导求的就是变化的比例
  - 当x和y给定一个，有对应的另一个便是隐形函数 求导只是链式法则的灵活运用
2. 普林斯顿第三章 极限
  - 更系统的复习一遍
3. 汇总统计和间接统计
  - sum and mean等 对na不同情况的处理方式 汇总统计
  - idxmax and idmin等 输出列和行的是索引 间接统计 
  - cumsum 每一行向下列不停加 累加统计
  - descible 一次性输出多种汇总统计
4. 获取a股股票数据的工具推进
  - bs.query_history_k_data_plus函数的初步认识
5. 整理和反思
  - 将这学期之前所学的excel sql整理
  - 大部分都已经遗忘 需要找时间重新温习
  - 许多知识还没有彻底掌握 需要多加记录和巩固