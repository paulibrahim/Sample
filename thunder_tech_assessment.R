###Notes: Performed All Operations in Base R
shots_df <- read.csv("C:/Users/pauli/Downloads/shots_data.csv") #reading in file after local download
sapply(shots_df, class) #checking the classes of each column in the dataset


shots_df$shot_zone <- "2PT" #creating a new column denoting the zone of the court the shot was taken from 

shots_df$hoop_dist <- sqrt(((shots_df$x)^2)+((shots_df$y)^2)) #calculating shot distance from hoop

shots_df$shot_zone[(shots_df$x>22 | shots_df$x < -22) & shots_df$y<=7.8] <- "C3" #designating corner 3's. Note: I assumed corner threes occur when magnitude of x is strictly greater than 22

shots_df$shot_zone[shots_df$hoop_dist>23.75 & shots_df$y>7.8] <- "NC3" #designating non-corner 3's. Note: I assumed NC3 zone is where the distance to the hoop strictly greater than 23.75

shots_df$mod_fgm <- shots_df$fgmade #creating a new column to denote field goals made with appropriate weighting according to the value of the shot

shots_df$mod_fgm[shots_df$shot_zone!="2PT"] <- (shots_df$mod_fgm[shots_df$shot_zone!="2PT"]*1.5) #applying the weighting to 3pt shots



teamA_shots <- shots_df[shots_df$team=="Team A", ] #creating dataframe for Team A's shots
teamA_2pt_shots <- teamA_shots[teamA_shots$shot_zone=="2PT",] #filtering for only 2pt shots
question_5 <- nrow(teamA_2pt_shots)/nrow(teamA_shots) #answer to question 5

teamA_nc3_shots <- teamA_shots[teamA_shots$shot_zone=="NC3",] #filtering for only NC3 shots
question_6 <- nrow(teamA_nc3_shots)/nrow(teamA_shots) #answer to question 6

teamA_c3_shots <- teamA_shots[teamA_shots$shot_zone=="C3",] #filtering for only C3 shots
question_7 <- nrow(teamA_c3_shots)/nrow(teamA_shots) #answer to question 7

question_8 <- (sum(teamA_2pt_shots$mod_fgm))/nrow(teamA_2pt_shots) #answer to question 8
question_9 <- (sum(teamA_nc3_shots$mod_fgm))/nrow(teamA_nc3_shots) #answer to question 9
question_10 <- (sum(teamA_c3_shots$mod_fgm))/nrow(teamA_c3_shots) #answer to question 10


teamB_shots <- shots_df[shots_df$team=="Team B", ] #creating dataframe for Team B's shots
teamB_2pt_shots <- teamB_shots[teamB_shots$shot_zone=="2PT",] #filtering for only 2pt shots
question_11 <- nrow(teamB_2pt_shots)/nrow(teamB_shots) #answer to question 11

teamB_nc3_shots <- teamB_shots[teamB_shots$shot_zone=="NC3",] #filtering for only NC3 shots
question_12 <- nrow(teamB_nc3_shots)/nrow(teamB_shots) #answer to question 12

teamB_c3_shots <- teamB_shots[teamB_shots$shot_zone=="C3",] #filtering for only C3 shots
question_13 <- nrow(teamB_c3_shots)/nrow(teamB_shots) #answer to question 13

question_14 <- (sum(teamB_2pt_shots$mod_fgm))/nrow(teamB_2pt_shots) #answer to question 14
question_15 <- (sum(teamB_nc3_shots$mod_fgm))/nrow(teamB_nc3_shots) #answer to question 15
question_16 <- (sum(teamB_c3_shots$mod_fgm))/nrow(teamB_c3_shots) #answer to question 16

#Answers
paste("Team A Percentage of Shots Attempted in 2PT Zone:", round(question_5,3))
paste("Team A Percentage of Shots Attempted in NC3 Zone:", round(question_6,3))
paste("Team A Percentage of Shots Attempted in C3 Zone:", round(question_7,3))
paste("Team A eFG% in 2PT Zone:", round(question_8,3))
paste("Team A eFG% in NC3 Zone:", round(question_9,3))
paste("Team A eFG% in C3 Zone:", round(question_10,3))

paste("Team B Percentage of Shots Attempted in 2PT Zone:", round(question_11,3))
paste("Team B Percentage of Shots Attempted in NC3 Zone:", round(question_12,3))
paste("Team B Percentage of Shots Attempted in C3 Zone:", round(question_13,3))
paste("Team B eFG% in 2PT Zone:", round(question_14,3))
paste("Team B eFG% in NC3 Zone:", round(question_15,3))
paste("Team B eFG% in C3 Zone:", round(question_16,3))


