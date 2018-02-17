# Load data
library(magrittr)

# Clean data
clean_data <- function(df) {
  extract_field <- function(possible_fields) {
    fields <- colnames(df)
    df[[intersect(fields, possible_fields)]]
  }

  df_out <- data.frame(
    VanID     = extract_field(c('VoterID', 'Voter.ID')) %>% sprintf("%7.7d", .),
    FirstName = extract_field(c('first.name', 'Voter.First.Name')),
    LastName  = extract_field(c('last.name', 'Voter.Last.Name')),
    Outcome   = extract_field(c('Result', 'Custom.Outcome', 'Level_of_Support')),
    stringsAsFactors = FALSE
  )
}

# Identify all the Level of Support outcomes in the dataset.
get_unique_outcomes <- function(df) {
  df$Outcome %>% unique
}

# Extract LOS data
LOS_map <- list(
                "8 - Not Voting"         = "Not Voting",
                "5 - Strong Opponent"   = "Strong Against",
                "4 - Lean Opponent"    = "Lean Against",
                "3 - Undecided"    = "Undecided",
                "2 - Lean Sameena"  = "Lean Sameena",
                "1 - Strong Sameena"   = "Strong Sameena",
                "6 - Lean Other"    = "Lean Against",
                "7 - Strong Other"      = "Strong Against",
                "1 - Strong Sameena - Volunteer Yes"  = "Strong Sameena",
                "1 - Strong Mustafa"   = "Strong Sameena",
                "2 - Lean Mustafa"    = "Lean Sameena",
                "4 - Lean Opponent "  = "Lean Against"
                )

extract_los <- function(df, outcome_los_values) {
  los_idx <- which(df$Outcome %in% outcomes_los_values)
  df_los <- df[los_idx, ]
  transform(df_los, Level_of_Support=LOS_map[Outcome] %>% Reduce(c, .))
}
