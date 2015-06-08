
seq<-c("GAAUAUUGUAUAUUGCAUAUAUCAUAUUUCAUAAUUGAUAUUUCAUAUAUCAUAUGACAUAUUGCAUAUUCCAUAUAUGAUACUGGAUAUAUUAUACCACAUAGCUCAUACUUCAUAAGGGAUAUGCUAUAUCUAAUAUCACAUAGUGUAUAACUCAUAGUCCAUAUUGUAUAGU")

seqmat<-matrix(as.factor(strsplit(seq,split="")[[1]]),25,7,byrow=TRUE)

seqdf<-as.data.frame(seqmat)

frtab<-matrix(NA,ncol(seqdf),4)

for(i in 1:ncol(seqdf)) 
{
  seqdf[,i]<- factor(seqdf[,i],levels=c("A","C","G","U"))
  frtab[i,]<-table(seqdf[,i])
}

colnames(frtab)<-c("A","C","G","U")

frtab<-t(frtab)


library(motifStack)

motif <- new("pcm", mat=frtab, name="Motif")

Sys.setenv(R_GSCMD="\"C:\\Program Files\\gs\\gs9.16\\bin\\gswin64c.exe\"")

plot(motif)
