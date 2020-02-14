library(mosaic)

xx1 = seq(0, 120)
vv1 = dnorm(xx1, mean = 60, sd = 10)
plot(vv1, xlab = 'x',ylab = 'Density', type = 'l')

xx2 = seq(0, 45, length = 45)
vv2 = dnorm(xx2, mean = 60, sd = 10)
polygon(c(xx2, rev(xx2)), c(rep(0,45),rev(vv2)), col = 'red')



xpnorm(45, mean = 60, sd = 10) #45KG 이상일 확률
xpnorm(80, mean = 60, sd = 10) #80kg 이상일 확률
xpnorm(c(55,65), mean = 60, sd = 10) #55kg에서 65kg 사이 획률


