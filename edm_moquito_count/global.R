#Global File used to make sure that the dataf is available to ui.R as well at startup
dataf<<-read.csv("www//mosquitoes_trap_data.csv")
dataf$TRAP_DATE=strptime(dataf$TRAP_DATE, format="%B %d %Y")
