library(SPEI)
library(dplyr)

data_mon <- df_monthly_updated
data_mon$TAVG <- (data_mon$TMAX + data_mon$TMIN) / 2

unique_ID <- unique(data_mon$ID)

# preallocate list by position, not ID
list_stations <- vector("list", length(unique_ID))

for (k in seq_along(unique_ID)) {
  id_k <- unique_ID[k]
  
  data1 <- data_mon[data_mon$ID == id_k, ]
  
  # just take the first latitude value
  unique_lat <- unique(data1$Lat)[1]
  
  # PET (Thornthwaite)
  pet_th <- thornthwaite(data1$TAVG, lat = unique_lat)
  
  # build working data frame
  df <- data1
  df$PET_thornwaite <- pet_th
  df$BAL_PRCP <- df$PRCP - df$PET_thornwaite
  
  # SPEI
  spei1  <- spei(df$BAL_PRCP,  1)
  spei3  <- spei(df$BAL_PRCP,  3)
  spei6  <- spei(df$BAL_PRCP,  6)
  spei12 <- spei(df$BAL_PRCP, 12)
  spei24 <- spei(df$BAL_PRCP, 24)
  
  df$spei1  <- spei1$fitted
  df$spei3  <- spei3$fitted
  df$spei6  <- spei6$fitted
  df$spei12 <- spei12$fitted
  df$spei24 <- spei24$fitted
  
  # SPI
  # spi1  <- spi(df$BAL_PRCP,  1,  distribution = "log-Logistic")
  # spi3  <- spi(df$BAL_PRCP,  3,  distribution = "log-Logistic")
  # spi6  <- spi(df$BAL_PRCP,  6,  distribution = "log-Logistic")
  # spi12 <- spi(df$BAL_PRCP, 12, distribution = "log-Logistic")
  # spi24 <- spi(df$BAL_PRCP, 24, distribution = "log-Logistic")
  # 
  # df$spi1  <- spi1$fitted
  # df$spi3  <- spi3$fitted
  # df$spi6  <- spi6$fitted
  # df$spi12 <- spi12$fitted
  # df$spi24 <- spi24$fitted
  
  # store by position
  list_stations[[k]] <- df
}

# bind all stations
df_final <- dplyr::bind_rows(list_stations)

# write.csv(
#   df_final,
#   "./data_raw\\df_monthly_SPEI_US.csv",
#   row.names = FALSE
# )
write.csv(
  df_final, "./data_raw\\df_monthly_SPEI_US.csv",
  row.names = FALSE
)

