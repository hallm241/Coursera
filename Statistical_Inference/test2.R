# Q2 probability of less than 70 for X ~ N(80,10^2)
pnorm(70,80,10)

# Q3 95th percentile of X ~ N(1100,75^2)
qnorm(0.95,1100,75)

1100 + 1.64*75

# Q4 95th percentile avg 100 X (as above). X' ~ N(1100,(75^2/100)
qnorm(0.95,1100,75/sqrt(100))

1100 + 1.64*7.5

# Q5 
pbinom(4 - 0.00001,5,0.5,lower.tail = FALSE)

0.5^5 +5*0.5^4 * (1-0.5)

# Q6 by the CLT the dist ~ N (15,1). thus 14 - 16 is 1 SD range, or approx 68%

# Q7 obvious

# Q8 
ppois(10,15)
