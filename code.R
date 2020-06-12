#pacakages
library(tidyverse)
library(stringr)
library(pdftools)
options(digits = 3) 

#Extract Data
fn <- system.file("extdata", "RD-Mortality-Report_2015-18-180531.pdf", package="dslabs")
system("cmd.exe", input = paste("start", fn))

#Read Data
txt <- pdf_text(fn)
x <- str_split(txt[9], '\n')
s <- x[[1]]

#Clean Data
s <- str_trim(s)
header_index<- str_which(s,'2015')[1]
header_index  <- s[2]
tmp <- str_split(header_index, "\\s+", simplify = TRUE)
month <- tmp[1]
header <- tmp[-1]
tail_index  <- str_which(s, "Total")
tail_index
n<-str_count(s[35], '\\d+')
