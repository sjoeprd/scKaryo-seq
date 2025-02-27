### AneuFinder automation script ###
setwd("~/Documents/aneufinder test/")
library(AneuFinder)
library(BSgenome.Hsapiens.UCSC.hg38)

# modify project name and bam-file directory
projectName <- "Henk"
bamDirectory <- "todo"

# set configuration file (mouse or human (GRCh37 or GRCh38))
#configFile <- "aneufinder_mouse.config"
configFile <- "aneufinder_human1.config"
#configFile <- "aneufinder_human_hg38.config"

### RUN FROM HERE ###

# generates novel directories from bam-file directory to store analysis files
inputdirs <- list.dirs(bamDirectory, recursive = F)
outputdirs <- list.dirs(bamDirectory, full.names = F, recursive = F)
outputdirs <- paste0("todo output/", outputdirs)

dir.create(path = "todo output")
for(i in 1:length(outputdirs)) {
  dir.create(path =  outputdirs[i])
}

hg38 <- read.table("hg38.chrom.sizes.txt", header = TRUE)

# iterates through bam-file directories and analyses results
for(i in 1:length(inputdirs)) {
  Aneufinder(inputfolder = inputdirs[i],
             outputfolder = outputdirs[i], 
             assembly = hg38,
             configfile = configFile)
}

# remove i-scar
remove(i)


