#ATIVIDADE - EXTRAÇÃO

ls()

gc()

for (itm in ls()) {
  print(formatC(c(itm, object.size(get(itm))),
                format = "d",
                width = 30),
        quote = F)
  
}

rm(list = c("sinistros2019e2020", "sinistrosRecife2019Raw",
            "sinistrosRecife2020Raw", "sinistrosRecife2021Raw", "common_cols", 
            "itm"))
