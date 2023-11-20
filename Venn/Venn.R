#下载包##加载包#
library (VennDiagram)  
library(openxlsx)

#数值导入，可对数值进行配对
DAVID <- read_excel("多物种-cDBG分析.xlsx", sheet = "All_Strain_DAVID")
BP <- DAVID[DAVID$Category=="GOTERM_BP_ALL",]
BP <- separate(BP,Term, sep="~",into=c("ID","Description"))
BP_PA<-BP[BP$Species=="P. aeruginosa", ]
BP_KP<-BP[BP$Species=="K. pneumoniae", ]
BP_AB<-BP[BP$Species=="A. baumannii", ]

set1 <- BP_PA$Description
set2 <- BP_KP$Description
set3 <- BP_AB$Description

#数据转置，如果不转后头函数venn.diagram对矩阵数值不识别#
set1=t(set1)
set2=t(set2)
set3=t(set3)

#三元#

venn.diagram(x=list(set1,set2,set3),
             
             scaled = T, # 根据比例显示大小
             
             alpha= 0.5, #透明度
             
             lwd=1,lty=1,col=c('#FFF2C0','#2F5597',"#CA3149"), #圆圈线条粗细、形状、颜色；1 实线, 2 虚线, blank无线条
             
             label.col ='black' , # 数字颜色abel.col=c('#FFFFCC','#CCFFFF',......)根据不同颜色显示数值颜色
             
             cex = 2, # 数字大小
             
             fontface = "bold",
             
             fill=c('#FFF2C0','#2F5597',"#CA3149"), # 填充色 配色https://www.58pic.com/
             
             category.names = c("P. aeruginosa", "K. pneumoniae","A. baumannii") , #标签名
             
             cat.dist = 0.05, # 标签距离圆圈的远近
             
             cat.pos = c(0, 0, -45), # 标签相对于圆圈的角度cat.pos = c(-10, 10, 135)
             
             cat.cex = 2, #标签字体大小
             
             cat.fontface = "italic", # 标签字体加粗
             
             cat.col='black' ,   #cat.col=c('#FFFFCC','#CCFFFF',.....)根据相应颜色改变标签颜色
             
             cat.default.pos = "text",  # 标签位置, outer内;text 外
             
             output=TRUE,
             
             filename='D:/R语言绘图-毕业论文/代码/CC_Venn.png',# 文件保存
             
             imagetype="png",  # 类型（tiff png svg）
             
             resolution = 400,  # 分辨率
             
             compression = "lzw"# 压缩算法
             
)

# 建立交集的分析
set11 <- BP_PA[BP_PA$Count>3,]$Description
set22 <- BP_KP[BP_KP$Count>3,]$Description
set33 <- BP_AB[BP_AB$Count>3,]$Description
common <- intersect(set11, intersect(set22,set33))
print(common)
BP_Common <- BP[BP$Description %in% common, ]
BP_Common$Species <- as.factor(BP_Common$Species)
BP_Common <- BP_Common[order(-BP_Common$Count),]
BP_Common$Description <- str_remove(BP_Common$Description, " process")
#分组柱状图
ggplot(BP_Common,
       
       aes(x=Description,y=GeneNumber, fill=Species)) +  #x、y轴定义；根据type填充颜色
  
  geom_bar(stat="identity", width=0.9) +  #柱状图宽度
  
  scale_fill_manual(values = c("#CA3149", "#2F5597", "#FFF2C0") ) + #柱状图填充颜色
  
  xlab("Biological Process") + #x轴标签
  
  ylab("Gene Number") +  #y轴标签
  
  labs(title = "Biological Process Enrichment")+ #设置标题
  
  theme_bw() +
  theme(legend.text = element_text(face  = "italic",size=16),text = element_text(family = "Times New Roman",size=16),plot.title = element_text(hjust = 0.5),axis.text.x=element_text(family="Times New Roman",size = 16,angle = 70,vjust = 1, hjust = 1 ))
#对字体样式、颜色、还有横坐标角度（）


#####-----------重复执行------------
Pathway <- DAVID_Pathway
PathWay_PA <- Pathway[Pathway$Species=="P. aeruginosa", ]
PathWay_KP <- Pathway[Pathway$Species=="K. pneumoniae", ]
PathWay_AB <- Pathway[Pathway$Species=="A. baumannii", ]

set1 <- PathWay_PA$Description
set2 <- PathWay_KP$Description
set3 <- PathWay_AB$Description

#数据转置，如果不转后头函数venn.diagram对矩阵数值不识别#
set1=t(set1)
set2=t(set2)
set3=t(set3)

#三元#

venn.diagram(x=list(set1,set2,set3),
             
             scaled = T, # 根据比例显示大小
             
             alpha= 0.5, #透明度
             
             lwd=1,lty=1,col=c('#FFF2C0','#2F5597',"#CA3149"), #圆圈线条粗细、形状、颜色；1 实线, 2 虚线, blank无线条
             
             label.col ='black' , # 数字颜色abel.col=c('#FFFFCC','#CCFFFF',......)根据不同颜色显示数值颜色
             
             cex = 2, # 数字大小
             
             fontface = "bold",
             
             fill=c('#FFF2C0','#2F5597',"#CA3149"), # 填充色 配色https://www.58pic.com/
             
             category.names = c("P. aeruginosa", "K. pneumoniae","A. baumannii") , #标签名
             
             cat.dist = 0.05, # 标签距离圆圈的远近
             
            cat.pos = c(0, 0, -45), # 标签相对于圆圈的角度cat.pos = c(-10, 10, 135)
             
             cat.cex = 2, #标签字体大小
             
             cat.fontface = "italic", # 标签字体加粗
             
             cat.col='black' ,   #cat.col=c('#FFFFCC','#CCFFFF',.....)根据相应颜色改变标签颜色
             
             cat.default.pos = "text",  # 标签位置, outer内;text 外
             
             output=TRUE,
             
             filename='D:/R语言绘图-毕业论文/代码/Pathway_Venn.png',# 文件保存
             
             imagetype="png",  # 类型（tiff png svg）
             
             resolution = 400,  # 分辨率
             
             compression = "lzw"# 压缩算法
             
)

# 建立交集的分析
set11 <- PathWay_PA$Description
set22 <- PathWay_KP$Description
set33 <- PathWay_AB$Description
Pathway_common <- intersect(set11, intersect(set22,set33))
print(Pathway_common)
PathWay_Common <- Pathway[Pathway$Description %in% Pathway_common, ]
PathWay_Common$Species <- as.factor(PathWay_Common$Species)
#PathWay_Common_three <- PathWay_Common_three[order(-PathWay_Common$Count),]
#PathWay_Common$Description <- str_remove(PathWay_Common$Description, " process")
#分组柱状图
ggplot(PathWay_Common,
       
       aes(x=Description,y=GeneNumber, fill=Species)) +  #x、y轴定义；根据type填充颜色
  
  geom_bar(stat="identity", width=0.9) +  #柱状图宽度
  
  scale_fill_manual(values = c("#CA3149", "#2F5597", "#FFF2C0") ) + #柱状图填充颜色
  
  xlab("Pathway") + #x轴标签
  
  ylab("Gene Number") +  #y轴标签
  
  labs(title = "Pathway Enrichment")+ #设置标题
  
  theme_bw() +
  theme(legend.text = element_text(face  = "italic",size=16),text = element_text(family = "Times New Roman",size=16),plot.title = element_text(hjust = 0.5),axis.text.x=element_text(family="Times New Roman",size = 16,angle = 75,vjust = 1, hjust = 1 ))
#对字体样式、颜色、还有横坐标角度（）