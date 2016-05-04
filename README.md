# zebrafish-expression

an R function that generates simple plots of gene expression during zebrafish (Danio rerio) embryonic development from a deep RNAseq timecourse dataset (Pauli et al., Genome Research 2012; Zhang, Vastenhouw et al., Genome Research 2014).

Installation notes:
1. Download the three data files (two .txt, one .csv) 
2. set working directory to their location within R using setwd().
3. Run the code to initialize the expression() function.
4. Call expression() at the command line, as in the examples below.

expression("sox32")
expression("Zv9_00019080")
expression("NM_131851")

Input can be gene name, Refseq ID, Ensembl ID (not quite yet), or Schier lab transcript ID.
Output is a base plot of expression over the timepoints contained in the transcriptome timecourse.

![My image](https://raw.githubusercontent.com/james-gagnon/zebrafish-expression/master/example.JPG)

# Future Development Ideas

1. multiple genes at the same time
2. more timepoints
3. add in other lab's gene expression datasets
4. document pipeline of reads > FPKM (currently contained in Pauli M&Ms)
