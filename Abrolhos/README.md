---
title: "Rats Abrolhos"
author: "Tati Micheletti / Instituto Brasileiro para Medicina da Conservacao"
date: "28 September 2019"
output: pdf_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
require("reproducible")
Require("secr")
googledrive::drive_auth(email = gargle::gargle_oauth_email(),
                        use_oob = gargle::gargle_oob_default())
googledrive::drive_deauth()
```

## Abrolhos 2019
### Santa Barbara 1

```{r SB1, echo = FALSE}
captureSB1path <- preProcess(url = "https://drive.google.com/open?id=1YJEDbTS2Hs5m1LIPJNXzHYbRQMKREYoD", 
                  targetFile = "capture1.txt", 
                  destinationPath = reproducible::checkPath(file.path(getwd(), "data"), 
                                                            create = TRUE), overwrite = TRUE)

detectorSB1path <- preProcess(url = "https://drive.google.com/open?id=1Dtzab2-EIWVPZl5bPcG97xEfQzA0kfN-", 
                  targetFile = "detector1.txt",
                  destinationPath = reproducible::checkPath(file.path(getwd(), "data"), 
                                                            create = TRUE), overwrite = TRUE)

SB1 <- secr::read.capthist(captfile =  captureSB1path$targetFilePath, 
                           trapfile = detectorSB1path$targetFilePath)

summary(SB1)
g0.1 <- secr.fit(SB1, model = list(g0 ~ 1, sigma ~ 1), CL = TRUE,
               verify = FALSE, buffer = 200)

densitySB1 <- derived(g0.1)
```

Home range results (sigma estimate, lcl = lowe95%CI; ucl = upper95%CI):
```{r, echo = FALSE}
knitr::kable(summary(g0.1)$predicted)
```

Density results (D estimate, lcl = lowe95%CI; ucl = upper95%CI):
```{r, echo = FALSE}
knitr::kable(densitySB1)
```

### Santa Barbara 2

```{r SB2, echo = FALSE}
captureSB2path <- preProcess(url = "https://drive.google.com/open?id=1CXe-u9x41OtBCgLMhXP7o1OtpxZ0c0nr", 
                  targetFile = "capture2.txt", 
                  destinationPath = reproducible::checkPath(file.path(getwd(), "data"), 
                                                            create = TRUE), overwrite = TRUE)

detectorSB2path <- preProcess(url = "https://drive.google.com/open?id=1M2mdWYVITY8pz4j5AWppQoX-dm5it04I", 
                  targetFile = "detector2.txt",
                  destinationPath = reproducible::checkPath(file.path(getwd(), "data"), 
                                                            create = TRUE), overwrite = TRUE)

SB2 <- secr::read.capthist(captfile =  captureSB2path$targetFilePath, 
                           trapfile = detectorSB2path$targetFilePath)

summary(SB2)
g0.2 <- secr.fit(SB2, model = list(g0 ~ 1, sigma ~ 1), CL = TRUE,
               verify = FALSE, buffer = 200)

densitySB2 <- derived(g0.2)
```

Home range results (sigma estimate, lcl = lowe95%CI; ucl = upper95%CI):
```{r, echo = FALSE}
knitr::kable(summary(g0.2)$predicted)
```

Density results (D estimate, lcl = lowe95%CI; ucl = upper95%CI):
```{r, echo = FALSE}
knitr::kable(densitySB2)
```

## RESULTS

For Santa Barbara 1, we have **65** rats/ha (CI95%: 12-358), 
with home range of **16.75m** (CI95%: 3.66-76.82).  

For Santa Barbara 2, we have **2.17** rats/ha (CI95%: 0.34-14), 
with home range of **40m** (CI95%: 11.12-143.93).  

Obs.: In my opinion, the deviation is really too big. We need to collect more data (ie. trapping for longer time and probably with a bigger grid...) ~TM
