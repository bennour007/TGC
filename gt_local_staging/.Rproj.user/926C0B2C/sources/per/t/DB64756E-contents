summarized_data <- data_united |> 
  group_by(
    zone,
    period
  ) |> 
  summarise(
    across(
      .cols = c(
        previous_negative, 
        previous_positive, 
        new_negative, 
        new_positive,
        hiv_status_not_ascertained,  
      ),
      \(x) sum(x, na.rm = T) 
    )
  )

write_csv(summarized_data, here::here("epi_reports_staging","data", "clean", "hiv_malawi_summarized.csv"))
