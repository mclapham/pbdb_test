cetacea_FW<-read.csv("https://github.com/mclapham/pbdb_test/raw/master/cetacea.csv")
cetacea_PBDB<-read.csv("http://paleobiodb.org/data1.1/occs/list.txt?base_name=Cetacea&limit=all")
cetacea_PBDB<-subset(cetacea_PBDB,cetacea_PBDB$matched_rank<=5) #only occurrences at genus level

#reads PBDB time intervals
time_int<-read.csv("http://paleobiodb.org/data1.1/intervals/list.txt?scale=1&limit=all")

#finds maximum age of oldest user-specified interval
max_interval_ma<-subset(time_int$early_age,time_int$interval_name=="Jurassic")

#finds minimum age of youngest user-specified interval
min_interval_ma<-subset(time_int$late_age,time_int$interval_name=="Cretaceous")

dinosauria_FW<-read.csv("https://github.com/mclapham/pbdb_test/raw/master/dinosauria_JK.csv")
dinosauria_PBDB<-read.csv(paste("http://paleobiodb.org/data1.1/occs/list.txt?base_name=Dinosauria&min_ma=",min_interval_ma,"&max_ma=",max_interval_ma,"&show=time,phylo,geo,ident&limit=all",sep=""))
dinosauria_PBDB<-subset(dinosauria_PBDB,dinosauria_PBDB$matched_rank<=5) #only occurrences at genus level

brachiopoda_FW<-read.csv("https://github.com/mclapham/pbdb_test/raw/master/brachiopoda_Perm.csv")
brachiopoda_PBDB<-read.csv("http://paleobiodb.org/data1.1/occs/list.txt?base_name=Brachiopoda&interval=Permian&limit=all")
brachiopoda_PBDB<-subset(brachiopoda_PBDB,brachiopoda_PBDB$matched_rank<=5) #only occurrences at genus level

#finds maximum age of oldest user-specified interval
max_interval_ma<-subset(time_int$early_age,time_int$interval_name=="Eifelian")

#finds minimum age of youngest user-specified interval
min_interval_ma<-subset(time_int$late_age,time_int$interval_name=="Frasnian")

trilobita_FW<-read.csv("https://github.com/mclapham/pbdb_test/raw/master/trilobita_EifelFras.csv")
trilobita_PBDB<-read.csv(paste("http://paleobiodb.org/data1.1/occs/list.txt?base_name=Trilobita&min_ma=",min_interval_ma,"&max_ma=",max_interval_ma,"&show=time,phylo,geo,ident&limit=all",sep=""))
trilobita_PBDB<-subset(trilobita_PBDB,trilobita_PBDB$matched_rank<=5) #only occurrences at genus level

#counts number of occurrences in each dataset
FW_cetacea_occs<-nrow(cetacea_FW)
PB_cetacea_occs<-nrow(cetacea_PBDB)
FW_dino_occs<-nrow(dinosauria_FW)
PB_dino_occs<-nrow(dinosauria_PBDB)
FW_brach_occs<-nrow(brachiopoda_FW)
PB_brach_occs<-nrow(brachiopoda_PBDB)
FW_trilo_occs<-nrow(trilobita_FW)
PB_trilo_occs<-nrow(trilobita_PBDB)

plot(c(FW_cetacea_occs,FW_dino_occs,FW_brach_occs,FW_trilo_occs),c(PB_cetacea_occs,PB_dino_occs,PB_brach_occs,PB_trilo_occs),xlab="Fossilworks occurrence count",ylab="PBDB API occurrence count",col=c("red","blue","orange","purple"),pch=16)
abline(0,1)
legend(35000,10000,c("Cetacea","J-K dinos","Perm brachs","Eifel-Fras trilos"),pch=16,col=c("red","blue","orange","purple"),bty="n")
