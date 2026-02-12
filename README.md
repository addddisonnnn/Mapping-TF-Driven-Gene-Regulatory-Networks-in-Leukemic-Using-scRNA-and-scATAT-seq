# Mapping-TF-Driven-Gene-Regulatory-Networks-in-Leukemia-Using-scRNA-and-scATAT-seq

#### Overview
This repository contains the setup for running pySCENIC on 10x Genomics single-cell RNA-seq data from K562 leukemia cells.

#### Configuration
1. Google Cloud VM
```bash
# Ubuntu 22.04 LTS — MUST use this version
gcloud compute instances create scenicplus-vm \
    --zone=us-central1-a \
    --machine-type=n1-standard-8 \
    --image-family=ubuntu-2204-lts \
    --image-project=ubuntu-os-cloud \
    --boot-disk-size=100GB

# SSH into VM
gcloud compute ssh scenicplus-vm --zone=us-central1-a
```
2. Docker + pySCENIC
```bash
# Install Docker
sudo apt update && sudo apt install -y docker.io
sudo systemctl start docker
sudo usermod -aG docker $USER
exit  # Reconnect SSH

# Pull and run pySCENIC container (NOT SCENIC+)
docker run -it -p 8888:8888 aertslab/pyscenic:0.12.1 /bin/bash

# Inside container: install Jupyter and dependencies
pip install jupyterlab scanpy pandas numpy matplotlib seaborn anndata requests

# Launch Jupyter
jupyter lab --ip=0.0.0.0 --port=8888 --no-browser --allow-root
```
3. Firewall Rule (For Browser Access)
```bash
# In separate Cloud Shell tab
gcloud compute firewall-rules create allow-jupyter \
    --allow tcp:8888 \
    --source-ranges 0.0.0.0/0 \
    --target-tags jupyter-vm

gcloud compute instances add-tags scenicplus-vm \
    --tags jupyter-vm \
    --zone us-central1-a
```
Access Jupyter: http://[YOUR-VM-EXTERNAL-IP]:8888 with token from terminal

#### Data Acquisition
K562 Leukemia Cells [10x Genomics](https://www.10xgenomics.com/datasets/10k-human-k562-r-cells-singleplex-sample-1-standard)

```bash
# Download from 10x Genomics website
wget https://cf.10xgenomics.com/samples/cell-exp/7.0.0/10k_K562_singleplex_10k_K562_singleplex/10k_K562_singleplex_10k_K562_singleplex_count_sample_filtered_feature_bc_matrix.h5
```
- Cells: 10,000
- Genes: 36,601
- Format: HDF5 (81.6 MB)
- Source: Chronic myelogenous leukemia cell line

Extra info
```bash
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
```

#### SCENIC Databases
```bash
mkdir -p ~/leukemia_project/databases
cd ~/leukemia_project/databases

# TF ranking databases (1.2 GB each) — MUST download both
wget https://resources.aertslab.org/cistarget/databases/homo_sapiens/hg38/refseq_r80/mc9nr/gene_based/hg38__refseq-r80__10kb_up_and_down_tss.mc9nr.genes_vs_motifs.rankings.feather
wget https://resources.aertslab.org/cistarget/databases/homo_sapiens/hg38/refseq_r80/mc9nr/gene_based/hg38__refseq-r80__500bp_up_and_100bp_down_tss.mc9nr.genes_vs_motifs.rankings.feather

# TF list
wget https://resources.aertslab.org/cistarget/tf_lists/allTFs_hg38.txt
```

#### Citation
```text
Aertslab. (2022). pySCENIC: Single-cell regulatory network inference and clustering.
10x Genomics. (2024). 10k K562 Singleplex Dataset.
```
