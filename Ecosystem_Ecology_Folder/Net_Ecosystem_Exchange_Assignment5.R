# Conduct t-tests for May, July, August, and June.
t_test_may <- t.test(nee ~ treatment, data = nee_data, subset = month == 5)
t_test_july <- t.test(nee ~ treatment, data = nee_data, subset = month == 7)
t_test_august <- t.test(nee ~ treatment, data = nee_data, subset = month == 8)
t_test_june <- t.test(nee ~ treatment, data = nee_data, subset = month == 6)
# Print t-test results
print(t_test_may)
print(t_test_june)
print(t_test_july)
print(t_test_august)

# Aggregate data for all months
treatment_mean <- aggregate(nee ~ month * treatment, data = nee_data, FUN = mean)

# Print aggregated data
print(treatment_mean)

# Create barplot data
barplot_data <- matrix(data = treatment_mean[, 3], nrow = 2, ncol = 4, byrow = TRUE)

# Create barplot with all 4 months. Previously excluded June.
barplot(barplot_data, names.arg = c("May", "June", "July", "August"), beside = TRUE, ylab = "NEE (umol m-2 s-1)", legend.text = c("Large", "Small"), args.legend = list(x = "topleft"))
