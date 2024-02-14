lue <- 1.3
ndvi <- 0.5
par <- 400
time <- 3600
gpp <- lue*ndvi*(par/1000000)*time
print(gpp)

b<-60
l <- 1
paro <- 1000
z <- 5
k <- 0.5/sin(b*pi/180)
parz <- paro*exp(-k*l*z)

z <- seq(from=0, to=5, by=0.1)

plot(x=z, y=parz, type="l", xlab="Canopy Depth (m)", ylab= "PAR(umol m-2 s-1)")
