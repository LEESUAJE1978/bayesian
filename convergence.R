x = rpois(300,3) ; z = cumsum(x)/seq(1:300)
plot(seq(1:300), z, type = 'l', ylim = c(0,6),xlab = "x", ylab = "mean")
title("Poisson Distribution(lamda =3)")
for (j in 1:10) {x = rpois(300,3); z= cumsum(x)/seq(1:300)
lines(seq(1:300),z, lty = j +1, col = j+1)}


x = rnorm(300, 1,1) ; z = cumsum(x)/seq(1:300)
plot(seq(1:300),z, type ='l', ylim = c(0,2), xlab = 'x',ylab = 'mean')
title("Normal Distribution(mean = 1, sd = 1)")
for (j in 1:5) { x = rnorm(300,1,1) ; z = cumsum(x)/seq(1:300)
lines(seq(1:300), z, lty = j + 1, col= j+1)}
