#' @title Training set
#' 
#' @description The training set is the expression profiles of a 15-gene panel from TCGA RNA-Seq pan-cancer (involving colon, gastric, and endometrial cancers) dataset.
#' 
#' @docType data
#' @keywords datasets
#' @name training_data
#' @usage training_data
#' @format A dataframe with 1383 rows (tumor samples) and 16 columns (MSI status of tumor samples, and 15 gene features). The column names
#' are as follows:
#' \describe{
#'   \item{MSI_status}{MSI_status}
#'   \item{\emph{DDX27}}{DEAD-box helicase 27}
#'   \item{\emph{EPM2AIP1}}{EPM2A interacting protein 1}
#'   \item{\emph{HENMT1}}{HEN methyltransferase 1}
#'   \item{\emph{LYG1}}{lysozyme g1}
#'   \item{\emph{MLH1}}{mutL homolog 1}
#'   \item{\emph{MSH4}}{mutS homolog 4}
#'   \item{\emph{NHLRC1}}{NHL repeat containing E3 ubiquitin protein ligase 1}
#'   \item{\emph{NOL4L}}{nucleolar protein 4 like}
#'   \item{\emph{RNLS}}{renalase, FAD dependent amine oxidase}
#'   \item{\emph{RPL22L1}}{ribosomal protein L22 like 1}
#'   \item{\emph{RTF2}}{replication termination factor 2}
#'   \item{\emph{SHROOM4}}{shroom family member 4}
#'   \item{\emph{SMAP1}}{small ArfGAP 1}
#'   \item{\emph{TTC30A}}{tetratricopeptide repeat domain 30A}
#'   \item{\emph{ZSWIM3}}{zinc finger SWIM-type containing 3}
#' }
#' @source \url{https://xenabrowser.net/datapages/}
NULL