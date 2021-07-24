read_ibge_pop_proj <- function(file) {
    
    source("code/functions/prep_ibge_pop_proj.R")
    
    df_ibge_proj_regions <- c(1:33) %>% 
        purrr::map(~prep_ibge_pop_proj(file = file, .)) %>%
        dplyr::bind_rows() %>% 
        dplyr::mutate(
            region = dplyr::case_when(
                region == "BRASIL" ~ "Brazil",
                region == "GRANDES REGIÕES: CENTRO-OESTE" ~ "Central-West",
                region == "GRANDES REGIÕES: NORDESTE"     ~ "Northeast",
                region == "GRANDES REGIÕES: NORTE"        ~ "North",
                region == "GRANDES REGIÕES: SUDESTE"      ~ "Southeast",
                region == "GRANDES REGIÕES: SUL"          ~ "South",
                TRUE ~ tools::toTitleCase(tolower(region))
            )
        ) %>%
        mutate(
            region = case_when(
                region == "Rio De Janeiro" ~ "Rio de Janeiro",
                region == "Rio Grande Do Norte" ~ "Rio Grande do Norte",
                region == "Rio Grande Do Sul" ~ "Rio Grande do Sul",
                region == "Mato Grosso Do Sul" ~ "Mato Grosso do Sul",
                TRUE ~ region
            )
        )
    
    
    df_state_info <- readr::read_csv("https://github.com/kelvins/Municipios-Brasileiros/raw/main/csv/estados.csv")
    
    
    df_ibge_proj_regions_uf <- 
        df_ibge_proj_regions %>% 
        dplyr::left_join(
            df_state_info %>% 
                dplyr::select(uf, nome) %>% 
                dplyr::bind_rows(
                    tibble::tibble(
                        uf = c("BR", "CW", "NE", "N", "SE", "S"),
                        nome = c("Brazil", "Central-West", "Northeast", "North", "Southeast", "South")
                    )
                ), by = c("region" = "nome")
        ) %>% 
        dplyr::select(
            region, uf, age, sex, dplyr::everything()
        )
    
    
    
    
    return(df_ibge_proj_regions_uf)
}
