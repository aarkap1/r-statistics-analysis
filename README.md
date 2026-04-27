# R Probability & Statistical Analysis

## Overview
Collection of R scripts demonstrating probability theory, binomial distributions, and real-world applications including random graph theory and disease prevalence modeling.

## Repository Contents

### 1. `binomial_probability_exercise.R`
- Basic binomial probability calculations
- Bernoulli trials simulation
- Visualization of binomial distributions
- R functions: `dbinom()`, `pbinom()`, `qbinom()`, `rbinom()`

### 2. `binomial_random_graphs.R`
- Advanced binomial applications
- Random graph theory (networks)
- Disease prevalence modeling (chickenpox example)
- Vertex degree distribution analysis

## Key Skills Demonstrated

| Skill | Implementation |
|-------|----------------|
| Random sampling | `sample()`, `rbinom()` |
| Probability calculations | `dbinom()`, `pbinom()` |
| Quantile computation | `qbinom()` |
| Data visualization | `barplot()`, `par()` |
| Statistical inference | Binomial condition checking |
| Real-world modeling | Disease spread, network theory |

## Example Output

```r
> dbinom(57, 100, 0.5)
[1] 0.03006864

> P(exactly 97 had chickenpox) = 0.005891
