#' @title Data preprocessing
#'
#' @description
#' \code{data_pre} This function selects matched genes and scales gene expression values (maximum=1, minimum=0).
#'
#' @details
#' The "input.path" refers to the path for input file. The "type" refers to official gene symbol or Entrez gene ID.
#' @param input.path The input file is a tab-delimited text file containing the gene expression profiling data in which each row is a gene and each column is a tumor sample.
#' @param type Character string indicating which gene identifier to use when matching.
#' @export
#' @return A m*n matrix contains the expression values of n matched genes in m tumor samples. 
#' @author Lin Li <cpu_lilin@@126.com>, Xiaosheng Wang <xiaosheng.wang@@cpu.edu.cn>
#' @examples
#' path = system.file("extdata", "example.txt", package = "PreMSI", mustWork = TRUE)
#' data_pre(path, type = "ID")
data_pre <- function(input.path, type = c("Symbol", "ID")) {

	## Check arguments
	if (missing(input.path) || class(input.path) != "character")
		stop("'input.path' is missing or incorrect")
        type <- match.arg(type)   
	
	## Read input data
	a <- read.table(input.path, stringsAsFactors = FALSE, header = TRUE, row.names = 1, sep = "\t", check.names = FALSE)
	
	## Filter and min-max scaling
	if (TRUE %in% is.na(match(feature[,type], rownames(a)))) {
		if (sum(!is.na(match(feature[,type], rownames(a)))) >= 5) {
			feature <- feature[!is.na(match(feature[,type], rownames(a))),]
			rownames(feature) <- NULL
		} else {
		stop("Some features of the current test set are missing!")
		}
	}
	a <- a[match(feature[,type], rownames(a)),, drop = FALSE]
	if (FALSE %in% complete.cases(a))
		stop("Predictor variables with missing values are presented in the current test set")
	if (dim(a)[2] != 1) {
		a <- apply(t(a), 2, function(x) {
			(x - min(x)) / (max(x) - min(x))
		})
		a[is.nan(a)] <- 1
	} else {
		a <- t(a)
	}
	if (type == "ID") {
		colnames(a) <- as.character(feature[,"Symbol"])
	}
	
	return(a)

}
