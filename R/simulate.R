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
desc(stock) <- "testing simulation and prediction"
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
mod <- a4a(fmodel, qmodel, stock = stock, indices = indices, fit = "assessment")

summary(propagate(stock, 10) + mod)

#fit <- a4aInternal(fmodel, qmodel, stock = stock, indices = indices)


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


# ------------------------------------------------
# 
# simulate from fitted model....
# 
# ------------------------------------------------

# first way: extract model params, formulas and variance matrices

# write idealised code

# get parameters, formula, and vcov matrices from fit
params <- pars(mod)

# simulate new parameters based on vcov in SCAPars object
paramsim <- simulate(params, nsim = 10)

# have a look at coeficients just out of interest
coef(paramsim)

# use these new parameters to predict F, stock n etc.
# based on ranges contained in SCAPars object...
# ... and the m and fprop slots in stock...
# so like the + function we still need these...
#simstock <- predict(paramsim, stock)

# another way is to use the + method

simstock <- stock + params # or simstock <- stock + mod

# to get predictions from SCAPars not simulations....
# fix vcov matrices to zero? ... 
# maybe do this in the simulate function...
vcov(paramsim) <- 0

catch.n(stock + paramsim) # or simstock <- stock + mod
