# 2025
##  12-27
1. 函数应用和映射
  - numpy的函数可以对pandas的对象使用(例如np.abs(DataFrame) or 多个值组成的Series)
  - 并且可以具体使用到行和列中(例如使用DataFrame.**apply**(函数) 默认为列)
  - 对于元素级的Python的函数可以使用**map**
2. 排列和排名
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
1. 