alpha <- 0.29
sin <- 341
sigma <- 5.67E-8
esky <- 0.78
esurface <- 0.98 
tsurface <- 288
tsky <- 242
sabs <- sin*(1-alpha)
#changing albedo
alpha <- alpha*0.95
#Rnet = Sin * (1-alpha) + (Lin - Lout)
Lin <- sigma*esky*(tsky^4)
Lout <- sigma*esurface*(tsurface)^4
Rnet <- sin * (1-alpha) + (Lin - Lout)
print(Rnet)