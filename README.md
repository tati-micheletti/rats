---
title: "Rats Abrolhos"
author: "Tati Micheletti / Instituto Brasileiro para Medicina da Conserva??o"
date: "28 September 2019"
output: pdf_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)

```

## Abrolhos 2019
### Santa Barbara 1

```{r SB1, echo = FALSE, include=FALSE}
library(secr)
SB1 <- secr::read.capthist(captfile =  "C:/Users/Tati/Documents/GitHub/Abrolhos/data/capture1.txt", 
                           trapfile = "C:/Users/Tati/Documents/GitHub/Abrolhos/data/detector1.txt")

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

```{r SB2, echo = FALSE, include=FALSE}

SB2 <- secr::read.capthist(captfile =  "C:/Users/Tati/Documents/GitHub/Abrolhos/data/capture1.txt", 
                           trapfile = "C:/Users/Tati/Documents/GitHub/Abrolhos/data/detector2.txt")

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
