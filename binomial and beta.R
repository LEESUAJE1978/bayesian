plot(dbinom(seq(0,40), 40,1/4), type = 'l', xlab ="", ylab="", 
     ylim=c(0,0.2), main = 'Binomial Distribution by various Parameters')
lines(dbinom(seq(0,40),40, 2/4), lty =2)
lines(dbinom(seq(0,40),40, 3/4), lty = 3)
legend('topright', c("Binomial(p=1/4)", "Binomial(p=2/4)", "Binomial(P=3/4)"), lty = c(1,2,3), cex = 0.7)


x = seq(0,1, length = 100)
curve(dbeta(x, 1, 1), type = 'l', ylim = c(0,6), ylab = 'Probability')#균일 분포형
curve(dbeta(x, 1,4), type = 'l', xlim = c(0,1), add = T, lty =2, col = 'blue') #단조감소형
curve(dbeta(x, 4,1), type = 'l', xlim = c(0,1), add = T, lty =4, col = 'red') #단조증가형
curve(dbeta(x, 2,6), type = 'l', xlim = c(0,1), add = T, lty =3, col = 'yellow') #좌측 왜곡형
curve(dbeta(x, 6,6), type = 'l', xlim = c(0,1), add = T, lty =5, col = 'green') #정규 분포형
curve(dbeta(x, 6,2), type = 'l', xlim = c(0,1), add = T, lty =6, col = 'purple') #우측 왜곡형
legend("topright", c("Be(1,1) : 균일분포형", "Be(1,4) : 단조감소형", "Be(4,1) : 단조 증가형",
                    "Be(2,6) : 좌측 왜곡형", "Be(6,6):정규 분포형", "Be(6,2): 우측 왜곡형"), lty = c(1,2,4,3,5,6),
       col = c("black", "blue", "red", "yellow", "green", "purple"),cex = 0.8)
