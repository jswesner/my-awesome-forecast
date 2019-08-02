#this code will create an updated forecast plot. We can re-run it with 
#new data each time. Steps = update data in flu trends, 2) run code

gflu = read.csv("http://www.google.org/flutrends/about/data/flu/us/data.txt",
                skip = 11)

y = ts(gflu$Massachusetts)

#fit arima model
arima_model = arima(y, order = c(3, 0, 1))

#forecast 10 steps ahead
#forecast = predict(arima_model, n.ahead = 10)



#plot(y, type='l', ylab="Flu Index", lwd=2, xlim=c(540, 640), ylim=c(0,4000))
#lines(forecast$pred, col="dodgerblue2", lw=2)


#How can we automate the process above?

#automatically store graph into working directory
jpeg("forecast_plot.jpg")
plot(y, type='l', ylab="Flu Index", lwd=2, xlim=c(540, 640), ylim=c(0,4000))
lines(forecast$pred, col="dodgerblue2", lw=2)
dev.off()

#do again, but this time include new predictions

predictions = data.frame(time = time(forecast$pred),
                         prediction = forecast$pred,
                         stde = forecast$se)

write.csv(predictions, file = "predictions.csv", row.names=F)




#the code below would go into a cron prompt, but Windows would use Windows Scheduler
"crontab -e"
"26 2 * * * Rscript /USD/onedrive/Rfun..."

