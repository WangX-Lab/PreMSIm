# PreMSIm
Prediction of microsatellite instability (MSI) based on gene expression profiles in cancer

## Description
The package is used to predict MSI based on the expression profiles of a 15-gene panel.

## Details
Microsatellite instability (MSI) is a genomic property of the cancers with defective DNA mismatch repair and is a useful marker for cancer diagnosis and treatment in diverse cancer types. In particular, MSI has been associated with the active immune checkpoint blockade therapy response in cancer. Most of computational methods for predicting MSI are based on DNA sequencing data and a few are based on mRNA expression data. Using the RNA-Seq pan-cancer datasets for three cancer cohorts (colon, gastric, and endometrial cancers) from The Cancer Genome Atlas (TCGA) program, we developed an algorithm (PreMSIm) for predicting MSI from the expression profiling of a 15-gene panel in cancer. We demonstrated that PreMSIm had high prediction performance in predicting MSI in most cases using both RNA-Seq and microarray gene expression datasets. Moreover, PreMSIm displayed superior or comparable performance versus other DNA or mRNA-based methods. Thus, PreMSIm has the potential to provide an alternative approach for identifying MSI in cancer.

Before the development and evaluation of classifier, all RSEM-normalized RNA-Seq gene expression values were added 1 and then log2-transformed, and all RNA-Seq and microarray gene expression values were scaled to the range [0,1] in both training and test datasets. Within each training set, we utilized the t-test to identify the most significant genes in distinguishing MSI-high cancers from MSI-low/microsatellite stability (MSS) cancers. The top 30 genes with the largest absolute t-scores were selected as predictors in the classification model. After feature selection, we used the k-Nearest Neighbors (*k*-NN, *k*=5) classifier for class prediction. We first used 10-fold cross validation (CV) to evaluate classifier performance. Next, we built the MSI prediction model PreMSIm, which included the TCGA pan-cancer (involving colon, gastric, and endometrial cancers) dataset as the training set, the *k*-NN (*k*=5) classification algorithm, and 15 gene features. The 15 gene features were the genes which were commonly selected across all loops of the pan-cancer 10-fold CV model. These genes included ***DDX27***, ***EPM2AIP1***, ***HENMT1***,  ***LYG1***, ***MLH1***, ***MSH4***, ***NHLRC1***, ***NOL4L***, ***RNLS***, ***RPL22L1***, ***RTF2***, ***SHROOM4***, ***SMAP1***, ***TTC30A***, and ***ZSWIM3***. 

## Installation
You can install the released version of **PreMSIm** with:
```r
if (!requireNamespace("devtools", quietly = TRUE))
    install.packages("devtools")
devtools::install_github("WangX-Lab/PreMSIm")
```

## Examples
```r
# Data preprocessing (select matched genes and 0-1 scale gene expression values) --------------
library(PreMSIm)
path = system.file("extdata", "example.txt", package = "PreMSIm", mustWork = TRUE)
data_pre(path, type = "ID")
```

```r
# Prediction of MSI ---------------------------------------------------------------------------
library(PreMSIm)
path = system.file("extdata", "example.txt", package = "PreMSIm", mustWork = TRUE)
input_data = data_pre(path, type = "ID")
msi_pre(input_data)
```