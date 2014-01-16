#
# a simple simulation
#

library(FLa4a)
data(ple4)
data(ple4.indices)

# ------------------------------------------------
# 
# now fit a stock, then we can simulate from it
# 
# ------------------------------------------------

# define conditioning stock

stock <- ple4[paste(1:7), paste(1985:2008)]
indices <- ple4.indices[c(1,3)]
indices[[1]] <- indices[[1]][1:7, paste(1985:2008)]
indices[[2]] <- indices[[2]][, paste(1985:2008)]

summary(stock)
summary(indices)

# define the data generating model

fmodel <- ~ s(year, k = 7) + s(age, k = 3) + te(age, year, k = c(3,3))
qmodel <- list( ~ s(age, k = 3),
                ~ age)

# fit the model to get parameter estimates to play with
fit <- a4aInternal(fmodel, qmodel, stock = stock, indices = indices)


# keep these here for debugging
srmodel = ~ factor(year)
n1model = ~ factor(age)
vmodel  = lapply(seq(length(indices) + 1), function(i) ~ 1)
covar = NULL
wkdir = NULL
verbose = FALSE
fit = "assessment"
niters = 1000
center = TRUE



