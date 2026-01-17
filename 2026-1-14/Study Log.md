# 2026
## 1-14
1. 宋浩概率论   
 - 或者用加法 和用乘法
 - 从n中去m(1<=m<=n) 讲顺序 组合在此基础上除以重复的次数m！ 得到不讲顺序
 - 随机试验 可重复 多结果 不确定 样本空间 所有可能由样本点组成
2. 《利用python数据分析》
 - 通过在index[[最外级], [其次]，[],[],……] 创建多层索引 选取 loc[[],[]]类似
 - unstack将多层索引转化为df stack转化回去
 - df的多层索引还可以对轴使用 .names对不同的索引命名 
 - nlevels 知道索引有多少层 通过MultiIndex将索引封装重复使用
 - swaplevel（索引的名称，索引的名称） 交换名称位置 sort_index（level=索引的层级）
 - 通过层级分组聚合 .group(level=索引的层级).聚合函数
 - set_index([])将列转化为索引 默认删除原列 drop=Ture保留 reset_index将索引转化为列
3. 《C 语言程序设计：现代方法》
 - 首行#指令 包含库 其次main主函数{调用的函数 语句 return值}
 - cc unix运行指令 前面加-o 命名可执行文件
 - 语句后面要加; 注释// 
 - 变量的类型 变量名称; 得先声明 
## 1-15
1. 宋浩概率论
 - 概率为0的事件可能发生
 - 古典概率 是有限的 等可能的
2. 《C 语言程序设计：现代方法》
 - double与float 都是储存浮点型的 d更大
 - 嵌套注释是不可以的 缩进和空格可读性高
 - 应该避免在命名时与关键字重名 标识符可以含有字母 数字和下划线 只能字母和下划线开头 标识符是对函数，变量等实体的命名
 - 常量使用全大写命名和下划线 即宏定义 #define 
 - scanf调用int整数型("%d", &x) float浮点型("%f", &x) x为标识符
 - 对变量可以在开头进行初始化 一个变量只能对应一个值
3. 《利用python数据分析》
 - merge(df，要链接的df，on=指定的列)没有指定默认是重复的列名 默认是都有的索引
 - 可以通过left_on= 和 right_on=  指定左右df列名 how=inner/outer 指定并集 交集  
 - 可以通过left_index= 和 right_index= 指定左右df的行索引链接 对于多层次索引 必须以列表指明多个列
 - 左表格df.join(右表格)类似于merge的索引合并 但是不可以有重复的列名 更类似合并
 - np数组使用concatenate合并运算 pd则是使用concat([df/series]/如果是字典则是键,axis=改变合并方向，join=类似merge传入inner得交集，keys=创建层次索引) 合并默认是并集
 - np.where(判断条件，条件为t时取的值 df/se，f时取的值)
## 1-16
1. 宋浩概率论
 - 条件概率的样本空间是发生变化的，在已经发生的事件A概率上B发生的概率即P(B|A)
2. 《利用python数据分析》
 - stack将列换成行 unstack将行换成列 
 - 对于多层次的索引df 传入level=固定索引
 - 转化缺失值要会默认提出 保留future_stack=True
 - PeriodIndex.from_fields 传入年份和季度转化为pd的period格式 to_timestamp("D/Y/M/H") 转化为具体的时间点 日/年/月/小时
 - .pop删除数据列 reset_index()将行标签转化为列 df.piovt(index=列标签,columns=从表格中选择行标签,values=值)
 - melt宽表格转化为长表格 id_vars指定保留标签 value_vars需要拆分标签
 - plt.plot（df）绘制折线图
## 1-17
1. 宋浩概率论 
 - 对总事件划分Ai……An求在总事件中B发生的概率=P(A1)P(B|A1)……P(An)P(B|An)
 - 全概率是在发生的全概率上求某一个原因发生的概率 即由结果推原因
 - 事件独立 无交集P(AB)=P(A)P(B)
2. 《利用python数据分析》
 - .figure绘画布 add_subplot()在此基础上创建子图