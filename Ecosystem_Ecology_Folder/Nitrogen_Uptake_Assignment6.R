# Read the data from CSV file
n_data <- read.csv(file.choose())

# Calculate means for N uptake across species and growth temperature
upplant_mean <- aggregate(upplant ~ sp * temp, data = n_data, FUN = mean)
print(upplant_mean)  # Print the mean uptake rates

# Perform ANOVA analysis for specific root length (srl) based on species and growth temperature
anova(lm(srl ~ sp * temp, data = n_data))

# Create a scatterplot of N uptake against root length
plot(upplant ~ rtlgnt, data = n_data, xlab = "Root Length (cm)", ylab = "Plant N uptake (ug N h^-1)")

# Perform simple linear regression between N uptake and root length
summary(lm(upplant ~ rtlgnt, data = n_data))
abline(reg = lm(upplant ~ rtlgnt, data = n_data))  # Add the regression line to the plot

# Perform ANCOVA to analyze the relationship between uptake and root length for each species
anova(lm(formula = upplant ~ sp * rtlgnt, data = n_data))

# Add colors to the plot representing diferent species
points(upplant ~ rtlgnt, data = n_data, pch = 16, col = as.factor(n_data$sp))

# Mean and standard deviations calculations
srl_mean_sd <- aggregate(srl ~ sp * temp, data = n_data, FUN = function(x) c(mean = mean(x), sd = sd(x)))

# Print the means and standard deviations.
print(srl_mean_sd)

# ANOVA tests for differences in srl among species and growth temperatures
anova_result <- anova(lm(srl ~ sp * temp, data = n_data))

# Print the results
print(anova_result)
# Creates a scatterplot of specific root length (srl) against specific leaf area (sla)
plot(srl ~ sla, data = n_data, xlab = "Specific Leaf Area (cm^2/g)", ylab = "Specific Root Length (cm/g)")

# Adds regression line
abline(regression_model)
# Colors the points
points(n_data$sla, n_data$srl, pch = 16, col = as.factor(n_data$sp))

# ANCOVA table to show differences in SLA and SRL
ancova_result <- anova(lm(srl ~ sla * sp, data = n_data))

# Print the ANCOVA table
print(ancova_result)
