# Names

# ------------ Basic
a <- as.data.frame(basic[1,])

b <- c("Mean Intensity", "Standard Deviation Intensity", 
       "Median Absolute Deviation (MAD) Intensity", "Quantile Intensity - 0.01", 
       "Quantile Intensity - 0.05", "Quantile Intensity - 0.5",
       "Quantile Intensity - 0.95", "Quantile Intensity - 0.99")

b <- cbind(b, a)

colnames(b) <- c("Feature", "Value")
rownames(b) <- NULL

b <- cbind(b, Approach = "Spatial-Independent Statistics on Pixel Intensities")

# ------------ Shape
a1 <- as.data.frame(shape[1,])

b1 <- c("Area size", "perimeter", "Mean Radius", 
       "Standard Deviation of the Mean Radius", "Max Radius", "Min Radius")

b1 <- cbind(b1, a1)

colnames(b1) <- c("Feature", "Value")
rownames(b1) <- NULL

b1 <- cbind(b1, Approach = "Object Shape")

# ------------ Haralick
a2 <- as.data.frame(haralick[1,])

b2 <- c("Angular Second Moment M1", "Contrast M1", "Correlation M1", 
        "Sum of Squares: Variance M1", "Inverse Difference Moment M1", 
        "Sum Average M1", "Sum Variance M1", "Sum Entropy M1", "Entropy M1", 
        "Difference Variance M1", "Diferrence Entropy M1", 
        "Information Measures Of Correlation - f12 M1", 
        "Information Measures Of Correlation - f13 M1", 
        "Angular Second Moment M2", "Contrast M2", "Correlation M2", 
        "Sum of Squares: Variance M2", "Inverse Difference Moment M2", 
        "Sum Average M2", "Sum Variance M2", "Sum Entropy M2", "Entropy M2", 
        "Difference Variance M2", "Diferrence Entropy M2", 
        "Information Measures Of Correlation - f12 M2", 
        "Information Measures Of Correlation - f13 M2")

b2 <- cbind(b2, a2)

colnames(b2) <- c("Feature", "Value")
rownames(b2) <- NULL

b2 <- cbind(b2, Approach = "Haralick's Pixel Texture")

# ------------ Moments
a3 <- as.data.frame(moment[1,])

b3 <- c("Center of Mass x", "Center of Mass y", "Elliptical Eccentricity",
        "Elliptical Fit Major Axis", "Object Angle")

b3 <- cbind(b3, a3)

colnames(b3) <- c("Feature", "Value")
rownames(b3) <- NULL

b3 <- cbind(b3, Approach = "Object Image Moments")


# ------------ Statistical Analysis of Spectral Density
a4 <- as.data.frame(fft)

b4 <- c("FFT Mean", "FFT Median", "FFT Standard Deviation",
        "FFT Sum of Variances")

b4 <- cbind(b4, a4)

colnames(b4) <- c("Feature", "Value")
rownames(b4) <- NULL

b4 <- cbind(b4, Approach = "Statistical Analysis of Spectral Density")


# ------------ First-Order Features
a5 <- as.character(as.list(primeiraordemAtributos[1,]))

b5 <- c("Energy", "Entropy", "Kurtosis", "Mean Deviation", "Skewness", 
        "Uniformity", "Mean", "Median", "Maximum", "Minimum", "Variance", 
        "Root Mean Square", "Standard Deviation")

b5 <- as.data.frame(cbind(b5, a5))

colnames(b5) <- c("Feature", "Value")
rownames(b5) <- NULL

b5 <- cbind(b5, Approach = "First-Order Features")


# ------------ Spatial Relationships between Two pixels using GLCM
a6 <- as.list(GLCMAtributos[1,])

b6 <- c("Mean", "Variance", "Auto Correlation", "Cluster Prominence", 
        "Cluster Shade", "Cluster Tendency", "Contrast", "Correlation", 
        "Difference Entropy", "Dissimilarity", "Energy", "Entropy", 
        "Homogeneity1", "Homogeneity2", "Inverse Difference Moment (Normalized)",
        "Inverse Difference Moment", "Inverse Variance", "Maximum Probability", 
        "Sum Average", "Sum Entropy", "Sum Variance")

b6 <- as.data.frame(cbind(b6, a6))

colnames(b6) <- c("Feature", "Value")
rownames(b6) <- NULL

b6 <- cbind(b6, Approach = "Spatial Relationships between Two pixels using GLCM")


# ------------ Spatial Relationships among runs of pixels using GLRLM
a7 <- as.list(GLRLMAtributos[1,])

b7 <- c("Grey Level Non-uniformity", "High Grey Level Run Emphasis", 
        "Long Run Emphasis", "Long Run High Grey Level Emphasis", 
        "Long Run Low Grey Level Emphasis", "Low Grey Level Run Emphasis",  
        "Run Length Non-uniformity", "Run Percentage", "Short Run Emphasis", 
        "Short Run High Grey Level Emphasis", "Short Run Low Grey Level Emphasis")

b7 <- as.data.frame(cbind(b7, a7))

colnames(b7) <- c("Feature", "Value")
rownames(b7) <- NULL

b7 <- cbind(b7, Approach = "Spatial Relationships among runs of pixels using GLRLM")

# ------------ Spatial Relationships among zones of 9-connected pixels using GLSZM
a8 <- as.list(GLSZMAtributos[1,])

b8 <- c("Small Area Emphasis", "Large Area Emphasis", "Intensity Variability", 
        "Size Zone Variance", "Zone Percentage", "Low Intensity", 
        "High Intensity Emphasis", "Low Intensity Small Area Emphasis", 
        "High Intensity Small Area Emphasis", "Low Intensity Large Area Emphasis",
        "High Intensity Large Area Emphasis")

b8 <- as.data.frame(cbind(b8, a8), stringsAsFactors=FALSE)

colnames(b8) <- c("Feature", "Value")
rownames(b8) <- NULL

b8 <- cbind(b8, Approach = "Spatial Relationships among runs of pixels using GLSZM")

# ----------- Juntando

total <- rbind(b, b1)
total <- rbind(total, b2)
total <- rbind(total, b3)
total <- rbind(total, b4)
total <- rbind(total, b5)
total <- rbind(total, b6)
total <- rbind(total, b7)
total <- rbind(total, b8)
