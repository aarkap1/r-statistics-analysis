##########################################################
# Math/DA 314/514 - Probability Exercise
# Binomial Distributions & Random Graph Theory
# Author: Aaron Kapamba
# Date: 2024
#
# Topics: Binomial probability, random sampling, 
#         network theory applications
##########################################################

# ========================================================
# PART 1: Basic Probability in R
# ========================================================

# Flipping 10 fair coins
S <- c("T","H")
sample(S, size=10, replace = TRUE)

# All possible outcomes (first 5 and last 5)
randomsamples <- expand.grid(coin1 = S, coin2 = S, coin3 = S, coin4 = S, coin5 = S, 
                             coin6 = S, coin7 = S, coin8 = S, coin9 = S, coin10 = S)
head(randomsamples, n=5)	
tail(randomsamples, n=5)

# ========================================================
# PART 2: Bernoulli Trials
# ========================================================

# Fair coin simulation (p = 0.5)
sample(0:1, size=10, replace = TRUE)

# Biased coin simulation (p = 0.9)
p <- 0.9 
sample(0:1, size=10, replace = TRUE, prob=c(1-p, p))

# All possible trial combinations
randomtrials <- expand.grid(Trial1 = 0:1, Trial2 = 0:1, Trial3 = 0:1, Trial4 = 0:1, Trial5 = 0:1, 
                            Trial6 = 0:1, Trial7 = 0:1, Trial8 = 0:1, Trial9 = 0:1, Trial10 = 0:1)
head(randomtrials, n=5)	
tail(randomtrials, n=5)

# ========================================================
# PART 3: Binomial Distribution Functions
# ========================================================

# (1) P(X = 57) where X ~ Bin(100, 0.5)
dbinom(57, size=100, prob=0.5)

# (2) P(X ≤ 57) where X ~ Bin(100, 0.5)
pbinom(57, size=100, prob=0.5)

# (3) Median of Bin(17, 1/3)
qbinom(0.5, size=17, prob=1/3)

# (4) 4 random samples from Bin(10, 0.8)
rbinom(n=4, size=10, prob=0.8)

# (5) P(X > 57) where X ~ Bin(100, 0.5)
1 - pbinom(57, size=100, prob=0.5)

# (6) P(44 < X < 56) where X ~ Bin(100, 0.5)
sum(dbinom(45:55, size=100, prob=0.5))

# ========================================================
# PART 4: Binomial Function Reference
# ========================================================
# dbinom() -> P(X = k)  [Probability mass function]
# pbinom() -> P(X ≤ k)  [Cumulative distribution]
# qbinom() -> Quantiles (find k given probability)
# rbinom() -> Random sampling from binomial distribution

# sample() syntax explanation:
# sample(0:1, size=10, replace=TRUE)
# - 0:1 = possible outcomes (0=Tail, 1=Head)
# - size=10 = number of trials
# - replace=TRUE = sampling with replacement (independent trials)

# ========================================================
# PART 5: Visualization of Binomial Distributions
# ========================================================

# Create a 2x2 grid of plots
par(mfrow = c(2, 2))

# Bin(10, 0.1) - Left-skewed, mean = 1
barplot(dbinom(0:10, 10, 0.1), main = "Bin(10, 0.1) - Mean = 1", 
        names.arg=0:10, col="skyblue", xlab="Successes", ylab="Probability")

# Bin(10, 0.62) - Slightly right-skewed, mean = 6.2
barplot(dbinom(0:10, 10, 0.62), main = "Bin(10, 0.62) - Mean = 6.2", 
        names.arg=0:10, col="lightgreen", xlab="Successes", ylab="Probability")

# Bin(10, 0.88) - Right-skewed, mean = 8.8
barplot(dbinom(0:10, 10, 0.88), main = "Bin(10, 0.88) - Mean = 8.8", 
        names.arg=0:10, col="salmon", xlab="Successes", ylab="Probability")

# Bin(10, 1) - Deterministic (always 10 successes), mean = 10
barplot(dbinom(0:10, 10, 1), main = "Bin(10, 1) - Mean = 10 (Deterministic)", 
        names.arg=0:10, col="gold", xlab="Successes", ylab="Probability")

# ========================================================
# PART 6: Real-World Application - Disease Prevalence
# ========================================================

# Problem: 90% of Americans had chickenpox by adulthood
# Sample: n = 100 adults
# Find: P(exactly 97 out of 100 had chickenpox)

# Check Binomial conditions:
# 1. Fixed number of trials (n=100) ✓
# 2. Independent trials (random sample) ✓
# 3. Two outcomes (had chickenpox / didn't) ✓
# 4. Constant probability (p=0.9) ✓

# Calculate probability
probability_97 <- dbinom(97, size=100, prob=0.9)
print(paste("P(exactly 97 had chickenpox) =", probability_97))

# Visualize the distribution
barplot(dbinom(80:100, 100, 0.9), main = "Chickenpox Prevalence (n=100, p=0.9)",
        names.arg=80:100, col="coral", xlab="Number who had chickenpox", 
        ylab="Probability", border="white")

# ========================================================
# PART 7: Random Graph Theory (Advanced)
# ========================================================

# Problem: 100 vertices (nodes). For each pair, flip a coin with P(edge)=p
# Let X = number of edges in the random graph

# Number of possible pairs = C(100, 2) = 100*99/2 = 4950
n_vertices <- 100
n_pairs <- choose(n_vertices, 2)  # = 4950

# X ~ Bin(n_pairs, p)
# For p = 0.01 (sparse graph), 0.05, 0.1

p_values <- c(0.01, 0.05, 0.1)
expected_edges <- n_pairs * p_values

print("Random Graph Properties:")
print(paste("Number of vertices:", n_vertices))
print(paste("Number of possible edges:", n_pairs))
for(i in 1:length(p_values)) {
  print(paste("p =", p_values[i], "-> Expected edges =", expected_edges[i]))
}

# Degree of a vertex Y ~ Bin(n_vertices - 1, p)
# Each vertex can connect to the other 99 vertices
degree_n <- n_vertices - 1  # = 99

print("\nVertex Degree Distribution:")
for(i in 1:length(p_values)) {
  expected_degree <- degree_n * p_values[i]
  print(paste("p =", p_values[i], "-> Expected degree =", expected_degree))
}

# ========================================================
# SUMMARY & KEY INSIGHTS
# ========================================================
# 
# 1. Binomial distributions model count of successes in fixed trials
# 2. R provides 4 core functions: d,p,q,r + binom
# 3. Visualizations reveal distribution shape based on p
# 4. Real applications: disease prevalence, random networks
# 5. Random graph theory applies to social media, neural networks,
#    epidemiology, and communication systems
#
# ========================================================