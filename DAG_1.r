#install.packages("dagitty")
library(dagitty)



DAG_1 <- dagitty('dag { 
  "AC Access" [latent,pos="-1.039,0.098"] 
  "Adaptation to local temperatures" [latent,pos="-0.382,0.170"] 
  "COVID-19" [latent,pos="-0.779,0.187"] 
  "Healthcare Access" [latent,pos="-0.928,0.156"] 
  "Heat Related ED Visits" [outcome,pos="-0.587,-0.095"] 
  "Lag Days " [adjusted,pos="-0.658,-0.336"] 
  "Long-Term Trends" [pos="-1.147,-0.476"] 
  "Pre-existing Conditions" [latent,pos="-0.617,0.206"] 
  "Seasonal Patterns" [pos="-0.978,-0.196"] 
  "Week Day" [adjusted,pos="-0.469,-0.322"] 
  Age [latent,pos="-0.388,0.047"] 
  Holidays [adjusted,pos="-0.276,-0.261"] 
  Humidity [pos="-1.012,-0.019"] 
  Month [pos="-0.969,-0.384"] 
  Sex [latent,pos="-0.297,-0.029"] 
  Socioeconomics [latent,pos="-0.206,0.083"] 
  Temperature [exposure,pos="-1.350,-0.097"] 
  
  "AC Access" -> "Heat Related ED Visits" 
  "Adaptation to local temperatures" -> "Heat Related ED Visits" 
  "COVID-19" -> "Heat Related ED Visits" 
  "Healthcare Access" -> "Heat Related ED Visits" 
  "Lag Days " -> "Heat Related ED Visits" 
  "Pre-existing Conditions" -> "Heat Related ED Visits" 
  "Seasonal Patterns" -> "Heat Related ED Visits" 
  "Seasonal Patterns" -> Temperature 
  "Week Day" -> "Heat Related ED Visits" 
  Age -> "Heat Related ED Visits" 
  Holidays -> "Heat Related ED Visits" 
  Humidity -> "Heat Related ED Visits" 
  Humidity -> Temperature 
  Month -> "Heat Related ED Visits" 
  Month -> "Seasonal Patterns" 
  Month -> Temperature 
  Sex -> "Heat Related ED Visits" 
  Socioeconomics -> "Heat Related ED Visits" 
  Temperature -> "Heat Related ED Visits" 
}')

plot(DAG_1)

adjustmentSets(DAG_1,exposure= "Temperature", outcome="Heat Related ED Visits")
#Things to Adjust for:
#Holidays, Humidity, Lag Days , Month, Seasonal Patterns, Week Day

