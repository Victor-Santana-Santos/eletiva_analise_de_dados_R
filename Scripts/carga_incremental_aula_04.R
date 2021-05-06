#ATIVIDADE: CARGA INCREMENTAL

library(dplyr)

# carrega base de dados original
chamadosTempoReal <- read.csv2('http://dados.recife.pe.gov.br/dataset/99eea78a-1bd9-4b87-95b8-7e7bae8f64d4/resource/079fd017-dfa3-4e69-9198-72fcb4b2f01c/download/sedec_chamados_tempo_real.csv')

# atualização da base de dados
chamadosTempoRealNew <- read.csv2('http://dados.recife.pe.gov.br/dataset/99eea78a-1bd9-4b87-95b8-7e7bae8f64d4/resource/079fd017-dfa3-4e69-9198-72fcb4b2f01c/download/sedec_chamados_tempo_real.csv', sep = ';', encoding = 'UTF-8')

# compara usando a chave primária
chamadosTempoRealIncremento <- (!chamadosTempoRealNew$processo_numero %in% chamadosTempoReal$processo_numero)

# retorna vetor com incremento
chamadosTempoReal[chamadosTempoRealIncremento,]

chamadosTempoRealIncremento

# junta base original e incremento
chamadosTempoReal <- rbind(chamadosTempoReal, 
                           chamadosTempoReal[chamadosTempoRealIncremento,])
