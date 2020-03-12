plot(dpois(seq(0,20), 4), type = 'l',ylim = c(0, 0.3), main = 'Poisson Distribution by various Parameters')
lines(dpois(seq(0,20),2), lty  = 2, col = 'red')
lines(dpois(seq(0,20), 6), lty = 3, col = 'blue')
grid()
legend("topright",c("Poisson(lambda = 2)", "Poisson(lambda = 4)", "Poisson (lambda = 6)"), 
       lty = c(2,1,3), col = c("red", "black", "blue"),cex = 0.7)


x <- seq(0,10, by = 0.01)
plot(x, dgamma(x, 1,1), type = "l", lty = 5, ylim = c(0,1), ylab = "Probability", 
     main = "Gamma Distribution by Various Parameters", col = 'red' )
par(new = T)
plot(x, dgamma(x, 1, 0.5), type = 'l', ylim=c(0,1), lty = 2, col = "blue", ylab = "")
par(new = T)
plot(x, dgamma(x,2,1), type = 'l', ylim = c(0,1), lty=4, col = 'green', ylab = "")
par(new = T)
plot(x, dgamma(x, 5,1), type = 'l', ylim = c(0,1), lty =1, col = "black", ylab = "")
par(new = T)
plot(x, dgamma(x,5,1), type = 'l', ylim = c(0,1), lty =3, col = 'brown', ylab = "")
legend("topright", c("Ga (1,1): 지수감소형", "Ga(1,0.5): 단조 감소형", "Ga(2,1):좌측 왜곡형", "Ga(3,1):점진 왜곡형",
                     "Ga(5,1): 완화 왜곡형"), lty = c(5,2,4,1,3), col = c("red","blue","green","black","brown"), cex = 0.7)
