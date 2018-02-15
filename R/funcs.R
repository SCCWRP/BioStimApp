

BioStimScore<-function(x_TN, x_TP, x_CHLA, x_AFDM, mod79, mod63){
  
  x_input<-data.frame(Nitrogen_Total_mgPerL=x_TN,
                      Phosphorus_as_P_mgPerL=x_TP,
                      Chlorophyll_a_mgPerm2=x_CHLA,
                      Ash_Free_Dry_Mass_mgPercm2=x_AFDM)
  analytes<-  !is.na(c(x_TN,x_TP,x_CHLA,x_AFDM))
  if(sum(analytes)==0) {
    x_input$Model<-NA
    x_input$CSCI_79<-NA
    x_input$CSCI_63<-NA
  } 
  else {
    poss.analytes<-c("TN","TP","CHLA","AFDM")
    my.model<-paste(poss.analytes[analytes],collapse="_")
    x_input2<-x_input[,analytes]
    x_input$Model<-my.model
    x_input$CSCI_79<-predict(mod79[[my.model]], newdata=x_input2, type="prob")[,2]
    x_input$CSCI_63<-predict(mod63[[my.model]], newdata=x_input2, type="prob")[,2]
    x_input}
  x.short<-x_input[,c("Model","CSCI_79","CSCI_63")]
  names(x.short)<-c("Model","Probability of CSCI >= 0.79", "Probability of CSCI >= 0.63")
  x.short
}
