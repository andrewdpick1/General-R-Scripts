# Sandy soil parameters
s_sand <- 0.25
r_sand <- 0.1
a_sand <- -0.035
n_sand <- 3.18
m_sand <- 0.686

# Generate soil water potential values
wp <- seq(from = -3000, to = 0, by = 50)

# Calculate wc_sand
num_sand <- s_sand - r_sand
dem_sand <- (1 + (a_sand * wp)^n_sand)^m_sand
wc_sand <- r_sand + (num_sand / dem_sand)

# Sand data frame
data_sand <- data.frame(wp, wc_sand)

# Make the initial plot that will be added to later. Starting with sandy soil.
plot(x = data_sand$wp, y = data_sand$wc_sand, type = "l", xlab = "Soil Water Potential (kPa)", ylab = "Soil water content (g/g)", lty = 1, ylim = c(0, .75), xlim = c(-3000, 0))

# Clay soil parameters
s_clay <- 0.5
r_clay <- 0.3
a_clay <- -0.033
n_clay <- 1.2
m_clay <- 0.171

# Calculate wc_clay
num_clay <- s_clay - r_clay
dem_clay <- (1 + (a_clay * wp)^n_clay)^m_clay
wc_clay <- r_clay + (num_clay / dem_clay)

# Clay data frame
data_clay <- data.frame(wp, wc_clay)

# Add clay soil to the same graph
lines(x = data_clay$wp, y = data_clay$wc_clay, type = "l", col = "red", lty = 2)

# Loamy soil parameters
s_loam <- 0.35
r_loam <- 0.22
a_loam <- -0.034
n_loam <- 2
m_loam <- 0.4

#calculate wc_loam
num_loam <- s_loam - r_loam
dem_loam <- (1 + (a_loam * wp)^n_loam)^m_loam
wc_loam <- r_loam + (num_loam / dem_loam)

# Loam data frame
data_loam <- data.frame(wp, wc_loam)

# Add loam to the same graph
lines(x = data_loam$wp, y = data_loam$wc_loam, type = "l", col = "blue", lty = 3)
# Add legend
legend("topright", legend = c("Sandy Soil", "Clay Soil", "Loamy Soil"), lty = c(1, 2, 3), col = c("black", "red", "blue"))

# Print the data frames
print("Data frame showing water content for all three soil types:")
print("Soil Water Potential (kPa) - Sandy Soil - Clay Soil - Loamy Soil")
print(data.frame(wp, data_sand$wc_sand, data_clay$wc_clay, data_loam$wc_loam))

# Set the variables for displaying the water content at given kPas.
wc_at_minus_2500_sand <- data_sand[data_sand$wp == -2500, "wc_sand"]

wc_at_minus_2500_clay <- data_clay[data_clay$wp == -2500, "wc_clay"]

wc_at_minus_2500_loam <- data_loam[data_loam$wp == -2500, "wc_loam"]

# Display the results for sandy soil
cat("Water content at -2500 kPa for sandy soil:", wc_at_minus_2500_sand)

# Display the results for clay soil
cat("Water content at -2500 kPa for clay soil:", wc_at_minus_2500_clay)

# Display the results for loam soil
cat("Water content at -2500 kPa for loamy soil:", wc_at_minus_2500_loam)
