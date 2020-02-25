# 불량품 추정문제
#제품을 생산하는데 기계의 상태가 양호하면 불량품 7%, 그렇지 않으면 불량품 30%
#평균적으로 기계가 양호한 경우는 90%
#제품 생산결과 [G,G,B,G,B,G,G,G,G, G-Good, B-Bad]
#가설 1: 기계 양호, 2: 기계 불량

pf <- function(g, prior){
  if(g == 1) post <- 0.93 * prior/(0.93 * prior + 0.7 *(1-prior)) #기계가 양호할 때의 우도(Likelihood)
  else post <- 0.07 * prior /(0.07 * prior + 0.3 *(1-prior)) #기계가 불량일 때 우도(Likelihood)
  return(post)
}

dd = c(1,1,0,1,0,1,1,1,1) #양호 또는 불량 발생
pp = rep(0, length(dd))

pp[1] = 0.7
for(i in 1:length(dd)) pp[i+1] = pf(dd[i], pp[i])
round(pp, 3)
