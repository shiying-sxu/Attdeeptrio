__INPUT_DIR="./data"
#输入文件夹


#10X
_OUTPUT_DIR="/data/testoutput"
_BAM_C="/data/Guppy5/HG002-chr20/20_10.bam"
_BAM_P1="/data/Guppy5/HG003-chr20/20_10.bam"
_BAM_P2="/data2/Guppy5/HG004-chr20/20_10.bam"


_SAMPLE_C="HG002"
_SAMPLE_P1="HG003"
_SAMPLE_P2="HG004"
_REF=${_INPUT_DIR}/GRCh38_no_alt_chr20.fa
_THREADS="40"
_CONTIGS="chr20"

# benchmarking
# benchmarking
BASELINE_VCF_FILE_PATH_C="/data/HG002_GRCh38_20_v4.2.1_benchmark.vcf.gz"
BASELINE_BED_FILE_PATH_C="/data/HG002_GRCh38_20_v4.2.1_benchmark_noinconsistent.bed"
BASELINE_VCF_FILE_PATH_P1="/data/HG003_GRCh38_20_v4.2.1_benchmark.vcf.gz"
BASELINE_BED_FILE_PATH_P1="/data/HG003_GRCh38_20_v4.2.1_benchmark_noinconsistent.bed"
BASELINE_VCF_FILE_PATH_P2="/data/HG004_GRCh38_20_v4.2.1_benchmark.vcf.gz"
BASELINE_BED_FILE_PATH_P2="/data/HG004_GRCh38_20_v4.2.1_benchmark_noinconsistent.bed"
OUTPUT_VCF_FILE_C="HG002.vcf.gz"
OUTPUT_VCF_FILE_P1="HG003.vcf.gz"
OUTPUT_VCF_FILE_P2="HG004.vcf.gz"




# Calculate number of Mendelian violation and de novo variants

mkdir -p ${_OUTPUT_DIR}/trio
M_VCF=${_OUTPUT_DIR}/trio/${_SAMPLE_C}_TRIO.vcf.gz
M_VCF_annotated=${_OUTPUT_DIR}/trio/${_SAMPLE_C}_TRIO_ann.vcf.gz

BCFTOOLS="/home/user/anaconda3/envs/atttrio/bin/bcftools"                          # e.g. BEDtools
BEDTOOLS="/home/user/anaconda3/envs/atttrio/bin/bedtools"                         # e.g. BEDtools
# merge predicted VCFs
${BCFTOOLS} merge ${_OUTPUT_DIR}/${_SAMPLE_C}.vcf.gz ${_OUTPUT_DIR}/${_SAMPLE_P1}.vcf.gz ${_OUTPUT_DIR}/${_SAMPLE_P2}.vcf.gz --threads 8 -f PASS -0 -m all -O z -o ${M_VCF}

${BCFTOOLS} index ${M_VCF}


RTGTOOLS="/home/user/anaconda3/bin/rtg"                         # e.g. BEDtools

# data preparing

${RTGTOOLS} format -o ${_OUTPUT_DIR}/GRCh38_no_alt_analysis_set.sdf "${_REF}"

# generarte BED file
FILE="${_OUTPUT_DIR}/trio.ped"
cat <<EOM >$FILE
#PED format pedigree
#fam-id ind-id pat-id mat-id sex phen
1 HG002 HG003 HG004 1 0
1 HG003 0 0 1 0
1 HG004 0 0 2 0
EOM

# get Mendelian vilations
_TRIO_PED=${_OUTPUT_DIR}/trio.ped
REF_SDF_FILE_PATH=${_OUTPUT_DIR}/GRCh38_no_alt_analysis_set.sdf

${RTGTOOLS} mendelian -i ${M_VCF} -o ${M_VCF_annotated} --pedigree ${_TRIO_PED} -t ${REF_SDF_FILE_PATH} |& tee ${_OUTPUT_DIR}/trio/MDL.log


# benchmark de novo variants
# note that checking de novo variants require a region specific in ${_CONTIGS}

# merge trio's bed file from 0_generate_trio_bed

_TRIO_BED_PATH="/data/output_uni/chr20_GUPPY5_trio_bed/bed/trio.bed"

# merge trio's true set
_TRIO_GIAB_MERGED=${_INPUT_DIR}/${_SAMPLE_C}_TRIO.vcf.gz

${BCFTOOLS} merge ${BASELINE_VCF_FILE_PATH_C} ${BASELINE_VCF_FILE_PATH_P1} ${BASELINE_VCF_FILE_PATH_P2} --threads 8 -f PASS -0 -m all -O z -o ${_TRIO_GIAB_MERGED}

${BCFTOOLS} index ${_TRIO_GIAB_MERGED}

# get de nove variants
python clair3.py Check_de_novo --call_vcf ${M_VCF} --ctgName ${_CONTIGS} --bed_fn ${_TRIO_BED_PATH} --true_vcf ${_TRIO_GIAB_MERGED} |& tee ${_OUTPUT_DIR}/trio/denovo_rst



