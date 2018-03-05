#' Functions for inicializing vocabulary instances
#' 
#' vocabulary()
#' @param word A word character to initialize.
#' @param content A list with extra content to put in.
#' @node Need to vectorize the initializing function.
#' @note Need to handle errors.


vocabulary <- function(word, content = list()){
  vocab <- list()
  vocab$name <- word
  vocab_out <- c(vocab, content)
  class(vocab_out) <- c('vocabulary','list')
  vocab_out
}

modify <- function(vocab, definition, add = T) {
  if(!inherits(vocab,'vocabulary')) stop('Input must be a vocabulary.')
}
