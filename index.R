library(XML)
library(mailR)

while ( 1 == 1){
  


theurl <- "http://paragonexchange.pk/"
tables <- readHTMLTable(theurl)
n.rows <- unlist(lapply(tables, function(t) dim(t)[1]))

out <- tables[[which.max(n.rows)]]
as.numeric(out[out$V1 == 'EUR',]$V3)
rate <-  as.numeric(as.character(out[out$V1 == 'EUR',]$V3))[1]
rate


send.mail(from = "muhammadzeeshan020@gmail.com",
          to = c("zeeshan.karamat@techlogix.com"),
          
          subject = paste("Rate is",rate),
          body = "Rate Reminder",
          smtp = list(host.name = "119.30.86.103", port = 25),
          authenticate = FALSE,
          send = TRUE)
Sys.sleep(3600)
}