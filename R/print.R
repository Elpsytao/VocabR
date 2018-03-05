#' Functions for output vocabulary instance
#' 
#' print.vocab()
#' @param vocab Print out a vocabulary instance
#' @note Need exceptiong handling part.
#' 




print.vocab <- function(vocab){
  writeLines(paste0(vocab$name,'\n\nDefinition:\n',
                    paste0(vocab$definition,collapse = '\n'),'\n\nThesaurus:\n', 
                    paste0(vocab$thesaurus,collapse = ', ')))
}
