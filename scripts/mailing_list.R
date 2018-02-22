clean_data <- function(df) {
  attach(df)
  df_clean <- data.frame(
                         VanID = Voter.File.VANID,
                         EnvName = paste(FirstName, LastName),
                         City = mCity,
                         State = mState,
                         Zip5 = substr(mZip5, 3, 7),
                         Zip4 = substr(mZip4, 3, 6),
                         Address = mAddress
                         )
  df_clean <- df_clean[order(df_clean$Address), ]
  detach(df)
  df_clean
}

combine_mailing_addresses <- function(df) {
  combine_names <- function(names) {
    if(length(names) > 2) {
      "Our neighbors at..."
    } else {
      paste(names, collapse=" and ")
    }
  }

  df_combined <- aggregate(list(EnvName=df$EnvName),
                           by=list(
                                   Address=df$Address,
                                   City=df$City,
                                   Zip5=df$Zip5,
                                   Zip4=df$Zip4,
                                   State=df$State),
                           FUN=combine_names)
}

prepare_mailing_list <- function(filenames) {
  df_data_cleaned <- filenames %>% lapply(read.csv, stringsAsFactors=FALSE) %>% lapply(clean_data)
  df_data_cleaned %>% Reduce(rbind, .) %>% combine_mailing_addresses
}
