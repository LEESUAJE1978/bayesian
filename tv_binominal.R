# 어느 지역의 1일 Tv 시청시간 조사 결과를 바탕으로 한 베이지안 추론
library(LearnBayes)

#이산형 사후분포(Discrete Posterior Distribution)####
p <- seq(0.1, 1, by = 0.1) #비율, 일일 3 시간 이상 TV를 시청하는 시청자 비율을 10% 단위 나눔
prior <- c(8.4, 23.2, 18.5, 15.8, 13.8, 10.7, 5.4, 3.7, 0.7, 0.0) # 연구자의 관찰 값 또는 주관적인 값
prior <- prior /sum(prior) #관찰값의 비율
data <- c(6, 4) #성공과 실패 횟수(10명 중 3시간 이상 TV 시청을 하는 사람의 수)
post <- pdisc(p, prior, data) #descrite posterior 값 구하는 함수 
round(cbind(p, prior, post),3) #비율, 사전, 사후 비율 matrix

plot(p, prior, xlim = c(0,1),ylim = c(0, 0.3), type = 'b', ylab = "Probability") #사전 분포 그래프
par(new = T) #그래프 겹쳐 그리기
plot(p, post, xlim = c(0,1), ylim = c(0, 0.3), type = "b", lty = 2, ylab = "", col = 'red')#사후 분포 그래프
legend("topright", c('prior', 'posterior'), lty = c(1,2), cex = 0.8, col = c('black', 'red'))#범례 
title("Discrete Prior/Posterior plot") #그래프 타이틀


#베타분포####
#가설(H1): 1일 TV 시청시간 3시간 이상
#가설(H2): 1일 TV 시청 시간 3시간 이하

cp <- cumsum(prior)
ab <- beta.select(list(p = cp[3], x = p[3]), list(p=cp[6], x = p[6]))
ab
print(c(cp[3],p[3])) #연구자는 중앙값이 0.3이라고 생각(?)
print(c(cp[6], p[6])) #연구자는 6번째 값이 6이라고 생각

triplot(ab, c(6,4), where = 'topleft')


quantile1 <- list(p = cp[3], x = p[3])
quantile2 <- list(p = cp[6], x = p[6])
(rr <- beta.select(quantile1, quantile2))

curve(dbeta(x, rr[1] + data[1], rr[2] + data[2]), from = 0, to = 1, xlab = "", ylab ="", lty=1)
curve(dbeta(x, data[1]+1, data[2]+1), add = T, lty =2)
curve(dbeta(x, rr[1], rr[2]), add = T, lty =3)
legend("topright", c("prior", "likelihood", "posterior"), lty = c(3,2,1), cex = 0.8)
title('Beta Prior / Posterior plot')

(postpar <- ab + c(6,4)) # 사후분포 a, b 값
(pa <- 1- pbeta(0.5, ab[1]+6, ab[2]+4)) #TV 시청시간이 1일 평균 3시간을 넘는 사후 분포 값
(qa <- qbeta(c(0.05, 0.95), ab[1]+6, ab[2]+4)) #95% 신뢰구간 값
(post <- postpar[1]/sum(postpar))

post.sample <- rbeta(100,postpar[1], postpar[2])
qq <- quantile(post.sample, c(0.05, 0.95))

hist(post.sample, probability = T, breaks = 20, col = "gray90", xlab = "", ylab = "")
points(density(post.sample, bw = .1), type = 'l', col = 'red', lwd = 2)
abline(v = qq[1], lty = 2, col = 'red')
abline(v = qq[2], lty = 2, col = 'red')
text(0.2, 1.0, paste("Lo=", round(qq[1],4)), cex = 0.8)
text(0.81, 1.0, paste("Up=", round(qq[2],4)), cex = 0.8)
text(0.2, 1.2, "alpha = 0.05", cex = 0.8)
text(0.81, 1.2, "alpha = 0.95", cex = 0.8)
predplot(postpar,10,6)

#Brute Force Method#### 
#히스토그램에 의해 모수공간을 몇 개의 공간으로 구분하고, 각 구간에 확률을 부여하는 사전 분포법을 'Brute Force Method"

midpt <- seq(0.05, 0.95, 0.1)
p <- seq(0.1, 1, by = 0.1)
prior <- c(8.4, 23.2, 18.5, 15.8, 13.8, 10.7, 5.4, 3.7, 0.7, 0.0)/100
data <- c(6,4)
par(mfrow =c (1,2))
curve(histprior(x, midpt, prior), from = 0, to =1,
      ylab = "Prior Density", ylim = c(0,0.3))
title("Prior Density using Histogram-Prior")
grid()
curve(histprior(x, midpt, prior) * dbeta(x, data[1]+1, data[2]+1),
      from = 0, to = 1, ylab = "Posterior Density")
title("Posterior Density Using Histogram -Prior")
grid()


#예측 분포 산정 ####
m <- 20
ys <- 0:20
pred <- pdiscp(p, prior, m, ys)
plot(ys, pred, type = "h", main = "Histogram by Prior" , xlab = "", ylab = "Probability")
lines(ys, pred, type = 'l', col = 'red', lty =2)
round(rbind(0:20, pred),3)
(pred.prob <- pbetap(postpar, m, ys))
plot(ys, pred.prob, type = 'h', main = "Histogram by Posterior", xlab = "", ylab = "Probability")
lines(ys, pred.prob, type = 'l', col = 'red', lty = 2)
discint(cbind(ys, pred.prob),0.90)
