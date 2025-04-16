
**Run Attdeeptrio ONT quick demo**: 



## Installation

```bash
# make sure channels are added in conda
conda config --add channels defaults
conda config --add channels bioconda
conda config --add channels conda-forge

# create conda environment named "attdeeptrio"

conda create -n attdeeptrio python=3.9.0 -y
conda activate attdeeptrio
# install pypy and packages in the environemnt
conda install -c conda-forge pypy3.6 -y
pypy3 -m ensurepip
pypy3 -m pip install mpmath==1.2.1

# install python packages in environment
pip3 install tensorflow
pip3 install tensorflow-addons tables
conda install -c anaconda pigz==2.4 cffi==1.14.4 -y
conda install -c conda-forge parallel=20191122 zstd=1.4.4 -y
conda install -c conda-forge -c bioconda samtools=1.10 -y
conda install -c conda-forge -c bioconda whatshap=1.4 -y
conda install -c conda-forge xz zlib bzip2 automake curl -y
conda install seaborn
#Go to the installation location of the Attdeepcaller program (download to the specified location and extract the samtools and longphase packages)
Cd Attdeepcaller
#Install libclair3:
make PREFIX=${CONDA_PREFIX}


# run Attdeeptrio-Trio
./run_Attdeeptrio_trio.sh \
  --bam_fn_c=${_BAM_C} \
  --bam_fn_p1=${_BAM_P1} \
  --bam_fn_p2=${_BAM_P2} \
  --output=${_OUTPUT_DIR} \
  --ref_fn=${_REF} \
  --threads=${_THREADS} \
  --model_path_clair3=/data/pretrainedmodel/r941_prom_sup_g5014/ \
  --model_path_clair3_trio=/data/model/ \
  --sample_name_c=${_SAMPLE_C} \
  --sample_name_p1=${_SAMPLE_P1} \
  --sample_name_p2=${_SAMPLE_P2}
```

Testing
conda activate attdeeptrio
sh Attdeeptrio_quick_demo_chr20.sh.sh #Testing(conda activate attdeepcaller)．
conda activate happy-env
sh Attdeeptrio_visualization_chr20.sh.sh #Test visualization(conda activate happy-env)
conda activate attdeeptrio
sh Attdeeptrio_caculateMCV.sh ###Test for other metrics
```


Data available

Reference genomes
GRCh38_no_alt
https://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/000/001/405/GCA_000001405.15_GRCh38/seqs_for_alignment_pipelines.ucsc_ids/GCA_000001405.15_GRCh38_no_alt_analysis_set.fna.gz





