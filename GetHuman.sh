#!/bin/sh
# =============================================================================
# GET GRC HUMAN GENOME
for((x=1; x<23; ++x));
  do 
  wget ftp://ftp.ncbi.nlm.nih.gov/genomes/Homo_sapiens/Assembled_chromosomes/seq/hs_ref_GRCh38.p2_chr$x.fa.gz ; 
  done
wget ftp://ftp.ncbi.nlm.nih.gov/genomes/Homo_sapiens/Assembled_chromosomes/seq/hs_ref_GRCh38.p2_chrX.fa.gz
wget ftp://ftp.ncbi.nlm.nih.gov/genomes/Homo_sapiens/Assembled_chromosomes/seq/hs_ref_GRCh38.p2_chrY.fa.gz
for((x=1; x<23; ++x)); 
  do 
  zcat hs_ref_GRCh38.p2_chr$x.fa.gz | grep -v ">" | tr -d -c "ACGTN" > HSC$x; 
  done
zcat hs_ref_GRCh38.p2_chrX.fa.gz | grep -v ">" | tr -d -c "ACGTN" > HSC23 ;
zcat hs_ref_GRCh38.p2_chrY.fa.gz | grep -v ">" | tr -d -c "ACGTN" > HSC24 ;
rm -f *.fa.gz ;
rm -f GRC*
# =============================================================================
