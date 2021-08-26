### IBGE Population Projection 2010-2060

#### Repository 'ibge_population-projection'

This code downloads and processes IBGE population projection data 2010-2060 provided by the Brazilian Institute of Geography and Statistics (Instituto Brasileiro de Geografia e Estatístics - IBGE)

The last population projection data was versioned in 2018 in a `.xls` file.  
Data source URL: [IBGE - Projeção da População (BR)](https://www.ibge.gov.br/estatisticas/sociais/populacao/9109-projecao-da-populacao.html?=&t=o-que-e) / [IBGE - Population Projection (ENG)](https://www.ibge.gov.br/en/statistics/social/population/18176-population-projection.html?=&t=o-que-e)

The projection consists in the total number of inhabitants from 2010 to 2060 at country, macroregion and state levels. Data is stratified by age, sex and for each location and year.

The processed/final dataset can be found at [https://github.com/lslbastos/ibge_population_projection/tree/main/output](output/data_pop_ibge_proj_2010-2016.csv)

#### Variables

Summary of the dataset's attributes:

| Variable     | Description                                | Values                                                                                                                                    |
|--------------|--------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------|
| `region`     | Location: country, region or state         | Text value with names of country ("Brazil"), five macroregions ("North", "Northeast", "Central-West", "Southeast", "South") and 27 states |
| `uf`         | Abbreviation of location's name            | Short-names of country ("BR"), five macroregions ("N", "NE", "CW", "SE", "S") and 27 states                                               |
| `age`        | Population's age group                     | Age ranges from 0 to 90. "TOTAL" includes all ages.                                                                                       |
| `sex`        | Population's biological sex                | Biological sexes: "male" and "female". Value "all" includes all sexes                                                                     |
| `year`       | Year of projection                         | Year values from 2010 to 2060                                                                                                             |
| `population` | Estimated population/number of inhabitants | Numeric values with estimated population quantities                                                                                       |

Note: For data-reading consistency purposes all variables are in text/string/character format.
