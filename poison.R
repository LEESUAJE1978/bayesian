dpois(0:10, 5)
seq(0:10)
seq_along(0:10)
sum(dpois(6:20,5))
sum(dpois(6:40,5))
1-ppois(5,5)

xx1 = seq(0,12)
vv1 = dpois(xx1,5)
plot(xx1,vv1, xlab = "x", ylab = 'Density',type = 'l')
xx2 = seq(0,5, length = 6)
vv2 = dpois(xx2, 5)
polygon(c(xx2, rev(xx2)), c(rep(0,6),rev(vv2)),col ='red')
title("Poisson Distribution - One Sided Test : (lambda = 5)")
(pa = 1 -round(ppois(5,5),5))
text(6.5, 0.1, expression(paste(alpha)),cex = 0.8)
text(7.5, 0.1, paste("=",pa),cex = 0.8)

library(mosaic)
1-xppois(5, lambda = 5) #5이상 확률
xppois(8, lambda = 5) - xppois(3, lambda = 5) #3-8사이 확률
xppois(c(3,8), lambda = 5)
