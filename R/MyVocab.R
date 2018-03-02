#' Functions refer to www.thesaurus.com and www.dictionary.com to get
#' a word's definiton or thesaurus.
#' 
#' get_thesaurus()
#' @param word The checking word, a character.
#' @param max The maximum number of thesaurus returned
#' @note Shoud vectorize the word param
#' 
#' get_definition(
#' @param word The checking word, a character.
#' @param max The maximum number of thesaurus returned
#' @note should format the output and vectorize the word param



library(RCurl)
library(XML)
library(stringr)
library(xml2)


get_thesaurus <- function(word, max = 8L) {
  url <- paste0("http://www.thesaurus.com/browse/",word,"?s=t")
  url_content <- read_html(getURL(url))
  range_match <- xml_find_all(url_content, xpath = '//li')
  strs <- range_match[grep('star inactive',range_match)]
  thesaurus <- str_match(strs, pattern = "browse/(.*?)\"")[,2]
  str_replace(thesaurus, '%20', ' ')[1:max]
}

get_definition <- function(word, max = 2){
  url <- paste0("http://www.dictionary.com/browse/",word,"?s=t")
  url_content <- read_html(getURL(url))
  content_node <- xml_find_all(url_content, xpath = "//div/div")
  def_content <- content_node[grepl("^(<div class=\"def-content)",content_node)]
  def_content <- str_replace_all(def_content,"[\r\n]",'')
  raw_def <- str_match_all(def_content,">(.*?)<")
  raw_def_2 <- lapply(raw_def, function(x) x[,2])
  defs <- lapply(raw_def_2, function(x) paste0(str_trim(x),collapse=''))
  unlist(defs)[1:max]
}


