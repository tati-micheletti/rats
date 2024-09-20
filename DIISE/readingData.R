library("data.table")
DT <- fread("DIISE/DIISE_2018_query.csv")
DT2 <- DT[`Eradication Start Date` != "null"]
DT3 <- DT2[`Eradication End Date` != "null"]
DT3[, `Eradication End Date` := as.numeric(`Eradication End Date`)]
DT3[, `Eradication Start Date` := as.numeric(`Eradication Start Date`)]
DT3[, totalYears := `Eradication End Date`-`Eradication Start Date`]
summary(DT3$totalYears)

DT3[totalYears < 2, c('Island Name', 'Country', 'Eradication Start Date', 'Eradication End Date')]
DT4 <- DT3[totalYears < 2, c('Country', 'Region', 'Eradication Start Date', 'Eradication End Date')]
