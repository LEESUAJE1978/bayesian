getwd()

dbinom(0, 20, 0.25) #4지선다 문제에서 무작위로 답을 정하였을 경우 한 문제도 못 맞출 확률
sum(dbinom(4:6, 20, 0.25)) #4지선다 문제에서 4개에서 6개 사이의 정답을 맞출 확률
sum(dbinom(8:20, 20, 0.25)) #4지선다 문제에서 8개에서 20개 사이의 정답을 맟출 확률
dbinom(20, 20, 0.25)  #4지선다 문제에서 무작위로 답을 정하였을 경우 모두 맞출 확률

pbinom(0,20,0.25)
pbinom(6,20,0.25)-pbinom(3,20, 0.25)
pbinom(20,20,0.25)

xx1 = seq(0,20)
vv1 = dbinom(xx1, size = 20, prob = 0.25)
plot(xx1, vv1,xlab = 'x', ylab = "Density", type ='l')
xx2 = seq(0,7, length = 8)
vv2 = dbinom(xx2, size = 20, prob = 0.25)
polygon(c(xx2, rev(xx2)), c(rep(0,8),rev(vv2)), col = 'red') #https://rfriend.tistory.com/159

title('Binom Distribution - One Sided Test: (n=20, p =0.25)')
(pa = 1-round(pbinom(7,20,0.25),5))
text(7.5,0.1,expression(paste(alpha)),cex = 0.8)
text(9,0.1, paste("=",pa),cex = 0.8)

#-
# install.packages('mosaic')
library(mosaic)
xpbinom(0,size = 20, prob = 0.25)
xpbinom(6,size = 20, prob = 0.25) - xpbinom(3, size = 20, prob = 0.25)
1-xpbinom(7,size = 20, prob = 0.25)
