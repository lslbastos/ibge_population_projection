prep_ibge_pop_proj <- function(file, sheet) {
    
    df_ibge_proj_2018 <- readxl::read_excel(path = here::here(file), sheet = sheet) 
    
    # Data input --------------------------------------------------------------
    
    
    # Data preparation --------------------------------------------------------
    
    sheet_name  <- colnames(df_ibge_proj_2018)[1]
    years_range <- df_ibge_proj_2018[4, -1] %>% as.numeric()
    
    male_line   <- which(df_ibge_proj_2018[, 1] == "POPULAÇÃO HOMENS - IDADES SIMPLES") + 2
    female_line <- which(df_ibge_proj_2018[, 1] == "POPULAÇÃO MULHERES - IDADES SIMPLES") + 2
    total_line  <- which(df_ibge_proj_2018[, 1] == "POPULAÇÃO TOTAL - IDADES SIMPLES") + 2
    
    df_ibge_proj_2018_male   <- df_ibge_proj_2018[male_line:(male_line + 91), ] %>% dplyr::mutate(sex = "male")
    df_ibge_proj_2018_female <- df_ibge_proj_2018[female_line:(female_line + 91), ] %>% dplyr::mutate(sex = "female")
    df_ibge_proj_2018_total  <- df_ibge_proj_2018[total_line:(total_line + 91), ] %>% dplyr::mutate(sex = "all")
    
    
    df_ibge_proj_proc <- dplyr::bind_rows(
        df_ibge_proj_2018_male,
        df_ibge_proj_2018_female,
        df_ibge_proj_2018_total
    ) %>% 
        dplyr::select_if(has_no_na_column)
    
    # df_ibge_proj_proc[, is.na(colSums(df_ibge_proj_proc %>% select_if(is.numeric)))]
    
    df_ibge_proj_final <- 
        df_ibge_proj_proc %>% 
        dplyr::mutate(
            region = sheet_name
        ) %>% 
        purrr::set_names(c("age", as.character(min(years_range, na.rm = TRUE):max(years_range, na.rm = TRUE)), "sex", "region")) %>% 
        dplyr::select(region, age, sex, everything()) %>% 
        dplyr::mutate(
            age = str_remove(age, "\\+")
        ) %>% 
        tidyr::pivot_longer(-c(region, age, sex), names_to = "year", values_to = "population")
    
    return(df_ibge_proj_final)
    
}