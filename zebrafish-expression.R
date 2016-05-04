# ------------------
#
# Zebrafish embryogenesis timecourse expression plots
#
# Example inputs below:
# ------------------

# expression("sox32")
# expression("Zv9_00019080")
# expression("NM_131851")


# ------------------
# set working directory and load files
# ------------------

# setwd("DIRECTORY THAT HOSTS FILES BELOW")

txtome <- read.csv("transcriptome_timecourse.csv")
GeneNameToRefSeq <- read.table("RefSeq_to_GeneName.txt")
RefSeqToZv9 <- read.table("reconst_to_refseq.txt")

# ------------------
# set up the function
# ------------------

expression<-function(input){

  # if user inputs Zv9ID 
  if (substr(input,1,3)=="Zv9"){Zv9ID <- input}
  
  # if user inputs RefSeqID
  else if (substr(input,1,3)=="NM_"){
    print(input)
    rowb <- which(RefSeqToZv9$V1 == input)
    if (length(rowb) == 0){stop("no Zv9 ID associated with this RefSeq ID")}
    Zv9ID <- as.character(RefSeqToZv9$V2[rowb[1]]) # use the first matching Zv9 ID only
    Zv9ID <- substr(Zv9ID, 1, nchar(Zv9ID)-2)      # shorten Zv9 ID at 3' end

  }
  
  # If user inputs gene name
  else{
    # Get RefSeqID(s) from gene name
    print(input)
    rowa <- which(GeneNameToRefSeq$V13 == input)
    if (length(rowa) == 0) {stop("Gene name matches no RefSeq IDs")}
    RefSeqID <- as.character(GeneNameToRefSeq$V2[rowa])
    print(RefSeqID)
    if (length(RefSeqID) > 1){stop("Gene name matches multiple RefSeq IDs, input correct RefSeq ID")}

    # Second get Zv9 identifier from RefSeq ID
    rowb <- which(RefSeqToZv9$V1 == RefSeqID[1])
    if (length(rowb) == 0){stop("no Zv9 ID associated with this RefSeq ID")}
    Zv9ID <- as.character(RefSeqToZv9$V2[rowb[1]]) # use the first matching Zv9 ID only
    Zv9ID <- substr(Zv9ID, 1, nchar(Zv9ID)-2)      # shorten Zv9 ID at 3' end

  }
  print(Zv9ID)
  if (nchar(Zv9ID[1]) == 0){stop("no Zv9 ID associated with this RefSeq ID")}
# get expression data 

rowc <- grep(Zv9ID,txtome$transcript.IDs)
if (length(rowc) == 0) {stop("no transcripts for this gene/RefSeq ID/Zv9 identifier are present in the RNA-Seq timecourse.")}
    
timecourse <- unlist(txtome[rowc,2:11])
max <- max(timecourse)+5

# plot timecourse
plot.default(timecourse, type="b",
             xlab="",ylab="FPKM",main=input,
             ylim=c(0,max),xaxt="n"
)
axis(1, at=1:10, 
     labels=c("2-4","256","1K","oblong","dome","shield","bud","28hr","48hpf","5day"),
     las=3)
}
