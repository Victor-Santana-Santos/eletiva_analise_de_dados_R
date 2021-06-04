# ATIVIDADE TIPOS E FATORES

alunos_origem <- c(1, 1, 2, 1, 3, 2, 1, 4, 1, 1)
recode <- c(Recife = 1, Aracaju = 2, Rio = 3, Paris = 4)
(alunos_origem <- factor(alunos_origem, levels = recode, labels = names(recode)))
