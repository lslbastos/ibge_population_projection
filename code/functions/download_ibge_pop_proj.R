
download_ibge_pop_proj <- function(filename) {
    path_to_save <- paste0(here::here(filename))
    
    download.file("https://ftp.ibge.gov.br/Projecao_da_Populacao/Projecao_da_Populacao_2018/projecoes_2018_populacao_idade_simples_2010_2060_20201209.xls", 
                  destfile = path_to_save, mode = "wb")
    
    # df_pop_ibge <- readxl::read_excel(path = tmp)
    print(paste("File saved at", path_to_save))
    
    return(NULL)
    
}
