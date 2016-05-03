# zebrafish-expression

an R function that generates simple plots of gene expression during zebrafish (Danio rerio) embryonic development from a deep RNAseq timecourse dataset (Pauli et al., Genome Research 2012; Zhang, Vastenhouw et al., Genome Research 2014).

Input can be gene name, Refseq ID, Ensembl ID (not quite yet), or Schier lab transcript ID.
Output is a base plot of expression over the timepoints contained in the transcriptome timecourse.

![My image](http://github.com/james-gagnon/zebrafish-expression/blob/master/example.JPG)

# Future Development Ideas

1. multiple genes at the same time
2. more timepoints
3. add in other lab's gene expression datasets
4. document pipeline of reads > FPKM (currently contained in Pauli M&Ms)
