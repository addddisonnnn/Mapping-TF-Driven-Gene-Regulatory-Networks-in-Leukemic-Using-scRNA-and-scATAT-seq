# Download from 10x Genomics website
wget https://cf.10xgenomics.com/samples/cell-exp/7.0.0/10k_K562_singleplex_10k_K562_singleplex/10k_K562_singleplex_10k_K562_singleplex_count_sample_filtered_feature_bc_matrix.h5

# Gene Expression - Feature / cell matrix HDF5 (per-sample)
wget https://cf.10xgenomics.com/samples/cell-exp/7.0.0/10k_K562_singleplex_10k_K562_singleplex/10k_K562_singleplex_10k_K562_singleplex_count_sample_filtered_feature_bc_matrix.h5

# Gene Expression - Feature / cell matrix (per-sample)
wget https://cf.10xgenomics.com/samples/cell-exp/7.0.0/10k_K562_singleplex_10k_K562_singleplex/10k_K562_singleplex_10k_K562_singleplex_count_sample_filtered_feature_bc_matrix.tar.gz

# Gene Expression - Sample barcodes
wget https://cf.10xgenomics.com/samples/cell-exp/7.0.0/10k_K562_singleplex_10k_K562_singleplex/10k_K562_singleplex_10k_K562_singleplex_count_sample_filtered_barcodes.csv

# Gene Expression - Clustering analysis
wget https://cf.10xgenomics.com/samples/cell-exp/7.0.0/10k_K562_singleplex_10k_K562_singleplex/10k_K562_singleplex_10k_K562_singleplex_count_analysis.tar.gz

# Summary CSV
wget https://cf.10xgenomics.com/samples/cell-exp/7.0.0/10k_K562_singleplex_10k_K562_singleplex/10k_K562_singleplex_10k_K562_singleplex_metrics_summary.csv

#SCENIC Databases
mkdir -p ~/leukemia_project/databases
cd ~/leukemia_project/databases

# TF ranking databases (1.2 GB each) — MUST download both
wget https://resources.aertslab.org/cistarget/databases/homo_sapiens/hg38/refseq_r80/mc9nr/gene_based/hg38__refseq-r80__10kb_up_and_down_tss.mc9nr.genes_vs_motifs.rankings.feather
wget https://resources.aertslab.org/cistarget/databases/homo_sapiens/hg38/refseq_r80/mc9nr/gene_based/hg38__refseq-r80__500bp_up_and_100bp_down_tss.mc9nr.genes_vs_motifs.rankings.feather

# TF list
wget https://resources.aertslab.org/cistarget/tf_lists/allTFs_hg38.txt