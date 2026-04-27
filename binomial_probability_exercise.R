##########################################################
#Catholic University of America 
#Math/DA 314/514 Probability Exercise
# Binomial Distribution Analysis in R
# Author: Aaron Kapamba
# Date: 2025
##########################################################

# ========================================================
# PART 1: Basic R Sampling (Coin Flips)
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

# Fair coin (p=0.5)
sample(0:1, size=10, replace = TRUE)

# Biased coin (p=0.9)
p <- 0.9
sample(0:1, size=10, replace = TRUE, prob=c(1-p,p))

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
# PART 4: Visualization of Binomial Distributions
# ========================================================

# Binomial distributions with different parameters
par(mfrow = c(2,2))  # 2x2 grid of plots

barplot(dbinom(0:10, 10, 0.1), main = "Bin(10, 0.1) - Mean = 1", 
        names.arg=0:10, col="skyblue", xlab="Number of Successes", ylab="Probability")

barplot(dbinom(0:10, 10, 0.62), main = "Bin(10, 0.62) - Mean = 6.2", 
        names.arg=0:10, col="lightgreen", xlab="Number of Successes", ylab="Probability")

barplot(dbinom(0:10, 10, 0.88), main = "Bin(10, 0.88) - Mean = 8.8", 
        names.arg=0:10, col="salmon", xlab="Number of Successes", ylab="Probability")

barplot(dbinom(0:10, 10, 1), main = "Bin(10, 1) - Mean = 10 (Deterministic)", 
        names.arg=0:10, col="gold", xlab="Number of Successes", ylab="Probability")

# ========================================================
# SUMMARY: R Binomial Functions
# ========================================================
# dbinom() - Probability mass function: P(X = k)
# pbinom() - Cumulative distribution: P(X ≤ k)
# qbinom() - Quantile function: find k given probability
# rbinom() - Random generation: simulate n random values
# ========================================================