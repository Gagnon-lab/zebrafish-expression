# zebrafish-expression

an R function that generates simple plots of gene expression during zebrafish (Danio rerio) embryonic development from a deep RNAseq timecourse dataset (Pauli et al., Genome Research 2012; Zhang, Vastenhouw et al., Genome Research 2014). This is bulk RNAseq of entire embryos at each time point (not single cell RNAseq).

Installation notes:

1. Download the three data files (two .txt, one .csv), and zebrafish-expression.R <br>
2. Open zebrafish-expression.R in R or Rstudio.<br>
2. set working directory to the location of the data files using setwd().<br>
3. Run the function code to initialize the expression() function. <br>
4. Call expression() at the command line, as in the examples below.<br>

expression("sox32")<br>
expression("Zv9_00019080")<br>
expression("NM_131851")<br>

Input can be gene name, Refseq ID, Ensembl ID (not quite yet), or Schier lab transcript ID.
Output is a base plot of expression over the timepoints contained in the transcriptome timecourse.

![My image](https://raw.githubusercontent.com/james-gagnon/zebrafish-expression/master/example.JPG)

# Future Development Ideas

1. multiple genes at the same time
2. more timepoints
3. add in other lab's gene expression datasets
4. document pipeline of reads > FPKM (currently contained in Pauli M&Ms)
