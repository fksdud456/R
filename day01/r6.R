m1 <- matrix(c(1, 2, 3, 4, 5, 6, 7, 8, 9), nrow=3)
colnames(m1) <- c('c1','c2','c3');
rownames(m1) <- c('r1','r2','r3');
m1[1,2]
m1[c(1,2),3]

m1[1,2]
m1[c(1:3),2]


m1[c('r2','r3'),'c3']

m1[c('r2',3),'c3']

m1*m1

nrow(m1)
ncol(m1)

cc1 <- m1[,1]

