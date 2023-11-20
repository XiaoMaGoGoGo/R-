# R语言绘图实战
R语言绘图实战资料

#1 热图
library(pheatmap)
library(ggplot2)
#数据准备data
p <- pheatmap(data）

#2 韦恩图
library (VennDiagram)  
library(openxlsx)
#数据准备：set1，set2，set3
venn.diagram(x=list(set1,set2,set3)）
