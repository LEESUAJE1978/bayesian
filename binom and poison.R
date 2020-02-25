#자동차 사고 발생이 1만대 당 1일 평균 1.5건일 때, 1일 사고 건수의 확률 분포를 이항 분포 및 포아송 분포로 산정

library(mosaic)
px = 0.0015
nn = 10000
pp = ppp = c(rep(1, 7))

for (x in 1:7){pp[x] = choose(nn, x-1)* px^(x-1)*(1-px)^(nn-x-1)
ppp[x] = 1.5^(x-1) * exp(-1.5) / factorial(x-1)}

pp
ppp

