# ATIVIDADE: TRABALHANDO COM TEXTOS

# PDF COM DATAS

library(dplyr)
library(pdftools)
library(textreadr)

edital_soc_2015 <- read_pdf('documentos/edital_sociologia_2015_retificado.pdf', ocr = T)

edital_soc_2015 <- edital_soc_2015 %>% group_by(element_id) %>% mutate(all_text = paste(text, collapse = " | ")) %>% select(element_id, all_text) %>% unique()

# Extração datas

library(stringr)

( datas <- str_extract_all(edital_soc_2015$all_text, "\\d{2}/\\d{2}/\\d{4}") )

# Modificação datas

(datas_modificadas <- str_replace_all(string = edital_soc_2015, "/", "-"))

(datas_02 <- str_extract_all(datas_modificadas, "\\d{2}-\\d{2}-\\d{4}"))
  