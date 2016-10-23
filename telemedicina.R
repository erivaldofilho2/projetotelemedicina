# Based on:
# https://cran.r-project.org/web/packages/radiomics/vignettes/TextureAnalysis.html
# http://earlglynn.github.io/RNotes/package/EBImage/Features.html
# https://github.com/aoles/EBImage/blob/master/R/computeFeatures.R

source("https://bioconductor.org/biocLite.R"); biocLite("EBImage")

# Setting Working Directory (where the images are)
setwd("~/Downloads/noduloSegmentado") #ubuntu
setwd("C:/Users/isadora/Downloads/noduloSegmentado") # windows

# Pacotes necessarios
library(radiomics)
library(EBImage)
library(psd)

# Reading a 2D image
nodulo <- readImage('nodulo20.png')[,,1]
#display(nodulo)
#print(nodulo)

nodulo2D <- as.matrix(as.data.frame(nodulo))

x = thresh(nodulo, 10, 10, 0.05)
#display(x)

# Computing Spatial-Independent Statistics on Pixel Intensities
basic <- computeFeatures.basic(x, nodulo)

# Computing features that quantify object shape
shape <- computeFeatures.shape(x, nodulo)

# Computing features that quantify pixel texture, according to Haralick's work 
haralick <- computeFeatures.haralick(x, nodulo)

# Computing features related to object image moments
moment <- computeFeatures.moment(x, nodulo)

# Computing Statistical Analysis of Spectral Density
# Using a fast Fourier transform
psp <- spectrum(nodulo, method = "pgram", plot = FALSE)

fft <- c(mean(psp$spec), median(psp$spec), sd(psp$spec), sum(var(psp$spec)))


# No slide: d = 1, e angle = 0, 45, 90, 135

# Computing First-Order Features
primeiraordemAtributos <- calc_features(nodulo2D)

# Computing Spatial Relationships between two pixels
# Using Grey Level Co-occurrence Matrix (GLCM)
nodulo_glcm <- glcm(nodulo2D, angle=0, d = 1, n_grey = 5)
GLCMAtributos <- calc_features(nodulo_glcm)
GLCMimg <- image(nodulo_glcm)

# Computing Spatial Relationships among runs of pixels
# Using Grey Level Run Length Matrix (GLRLM)
nodulo_glrlm <- glrlm(nodulo2D, angle=0, n_grey = 5)
GLRLMAtributos <- calc_features(nodulo_glrlm)
GLRLMimg <- image(nodulo_glrlm)

# Computing Spatial Relationships among zones of 9-connected pixels
# Using Grey Level Size Zone Matrix (GLSZM)
nodulo_glszm <- glszm(nodulo2D, n_grey = 10)
GLSZMAtributos <- calc_features(nodulo_glszm)
GLSZMimg <- image(nodulo_glszm)
