#' @title Prediction of microsatellite instability
#'
#' @description
#' \code{msi_pre} Prediction of MSI from gene expression profiling data.
#'
#' @details
#' One or multiple tumor samples to be predicted as MSI or non-MSI based on their expression profiles of the gene panel.
#' 
#' @param input_data Tumor samples to be predicted.
#' @import class
#' @export
#' @return A dataframe with 2 columns:
#' \item{Sample_ID}{Tumor samples to be predicted.}
#' \item{MSI_status}{Prediction results ("1" indicates MSI-high, and "0" MSI-low/microsatellite stability).}
#' @author Lin Li <cpu_lilin@@126.com>, Xiaosheng Wang <xiaosheng.wang@@cpu.edu.cn>
#' @examples
#' path = system.file("extdata", "example.txt", package = "PreMSI", mustWork = TRUE)
#' input_data = data_pre(path, type = "ID")
#' msi_pre(input_data)
msi_pre <- function(input_data) {

	## Check arguments
	if (missing(input_data) || !class(input_data) %in% c("matrix", "data.frame") || dim(input_data)[2] < 5)
		stop("'input_data' is missing or incorrect")
	
	## Predict MSI
	if (dim(input_data)[2] != dim(training_data)[2] - 1) {
		training_data <- training_data[,c(1, match(colnames(input_data), colnames(training_data)))]
	}
	if (dim(input_data)[1] != 1) {
		training_data[-1] <- apply(training_data[-1], 2, function(x) {
			(x - min(x)) / (max(x) - min(x))
		})
	}
	set.seed(1)
	knn.pred <- knn(training_data[,-1], input_data, training_data[,1], k = 5, prob = TRUE)
	result <- data.frame(Sample = rownames(input_data), MSI_status = knn.pred, check.names = FALSE)
	return(result)

}
