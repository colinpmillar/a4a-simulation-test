# session Info

R version 3.0.1 Patched (2013-09-13 r63932)
Platform: x86_64-pc-linux-gnu (64-bit)

locale:
 [1] LC_CTYPE=en_GB.UTF-8       LC_NUMERIC=C               LC_TIME=en_GB.UTF-8        LC_COLLATE=en_GB.UTF-8     LC_MONETARY=en_GB.UTF-8   
 [6] LC_MESSAGES=en_GB.UTF-8    LC_PAPER=en_GB.UTF-8       LC_NAME=C                  LC_ADDRESS=C               LC_TELEPHONE=C            
[11] LC_MEASUREMENT=en_GB.UTF-8 LC_IDENTIFICATION=C       

attached base packages:
[1] splines   grid      stats     graphics  grDevices utils     datasets  methods   base     

other attached packages:
 [1] FLa4a_0.9.8         np_0.50-1           cubature_1.1-2      boot_1.3-9          latticeExtra_0.6-26 RColorBrewer_1.0-5 
 [7] triangle_0.8        copula_0.999-7      mgcv_1.7-27         nlme_3.1-113        Matrix_1.1-1.1      FLCore_2.5.20140110
[13] MASS_7.3-29         lattice_0.20-24     colorout_1.0-2     

loaded via a namespace (and not attached):
[1] ADGofTest_0.3    gsl_1.9-10       mvtnorm_0.9-9996 pspline_1.0-16   stabledist_0.6-6 stats4_3.0.1     tools_3.0.1     

# ------------------------------------
#
#     bug 1
#
# ------------------------------------


# prep
library(FLCore)
data(ple4.index)

# problem extracting by dimname only in age dimension
ple4.index["1", ]

#Error in checkAtAssignment("FLIndex", "range", "character") : 
#  assignment of an object of class “character” is not valid for @‘range’ in an object of class “FLIndex”; is(value, "numeric") is not TRUE

#but this is okay
ple4.index[, "2000"]
