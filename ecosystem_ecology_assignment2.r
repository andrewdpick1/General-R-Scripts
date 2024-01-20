# Angular momentum of African elephant at equator
# Mass of African elephant
m1 <- 6000
# Velocity of African elephant around the equator. v = 40075 km/24hr = 1670
v1 <- 1670
# Radius of rotation of Earth at the equator
r1 <- 6370
# Calculate angular momentum
ma1 <- m1 * v1 * r1
# Print the answer
print(ma1)

# Recalculate radius of rotation for African elephant at Chiang Mai latitude (18 degrees N)
r1 <- 6370 * cos(18 * pi / 180)

# Generate sequence of latitudes
lat1 <- seq(from = 0, to = 18, by = 1)

# Calculate radius of rotation at each latitude
r1 <- 6370 * cos(lat1 * pi / 180)

# Calculate velocity at each latitude
v1 <- ma1 / (m1 * r1)

# Print angular momentum
print(ma1)


# Mass of Asian elephant
m <- 4000
# Velocity of Asian elephant around the equator. v = 40075 km/24hr = 1670
v <- 1670
# Radius of rotation of Earth at the equator
r <- 6370
# Calculate angular momentum
ma <- m * v * r
# Recalculate for the angular momentum of African elephant at 18 degrees north
r <- 6370 * cos(18 * pi / 180)
v <- ma / (m * r)

# Calculate angular momentum at 18 degrees north
ma_18_degrees_north <- m * v * r

# Print the angular momentum at 18 degrees north
print(ma_18_degrees_north)

# Calculate velocity for Asian elephant between the equator and Chiang Mai
latitudes <- seq(from = 0, to = 80, by = 1)

# Calculate radius of rotation at each latitude
radii <- 6370 * cos(latitudes * pi / 180)

# Calculate velocity at each latitude for Asian elephant
v <- ma / (m * radii)

# Plot the graphs for asian and african elephants. no clue why they're the exact same
plot(x = latitudes, y = v, xlab = "Latitude", ylab = "Velocity of Asian Elephant (km/h)", type = "l", col = "blue", lwd = 2)
plot(x = lat1, y = v1, xlab = "Latitude", ylab = "Velocity of African Elephant (km/h)", type = "l", col = "red", lwd = 2)

