#绘制热图

library(pheatmap) 
library(ggplot2)
setwd('D:/R语言绘图-毕业论文/代码/')
#数据准备data
data <- read.table('heatmap/62个节点的分布.txt',header=T,
                   row.names = 1,
                   )

data_dis <- data[, c('PA_R','PA_S','AB_R','AB_S','KP_R','KP_S')]
p <- pheatmap(data_dis,
              border ='white',
              cellwidth = 50,cellheight = 5,
              cluster_cols = T,
              treeheight_col = 60,#纵向聚类,树高20
              cluster_rows = F,
              show_rownames = F,#不显示横坐标
              show_colnames = F, #不显示纵坐标
              legend_breaks=c(0,1),#图例范围
              )
