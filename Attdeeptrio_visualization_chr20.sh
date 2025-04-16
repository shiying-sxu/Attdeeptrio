
_INPUT_DIR="./data"
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
BASELINE_VCF_FILE_PATH_C="HG002_GRCh38_20_v4.2.1_benchmark.vcf.gz"
BASELINE_BED_FILE_PATH_C="HG002_GRCh38_20_v4.2.1_benchmark_noinconsistent.bed"
BASELINE_VCF_FILE_PATH_P1="HG003_GRCh38_20_v4.2.1_benchmark.vcf.gz"
BASELINE_BED_FILE_PATH_P1="HG003_GRCh38_20_v4.2.1_benchmark_noinconsistent.bed"
BASELINE_VCF_FILE_PATH_P2="HG004_GRCh38_20_v4.2.1_benchmark.vcf.gz"
BASELINE_BED_FILE_PATH_P2="HG004_GRCh38_20_v4.2.1_benchmark_noinconsistent.bed"
OUTPUT_VCF_FILE_C="HG002.vcf.gz"
OUTPUT_VCF_FILE_P1="HG003.vcf.gz"
OUTPUT_VCF_FILE_P2="HG004.vcf.gz"



# Benchmark variant calls against truth set with hap.py
mkdir -p ${_OUTPUT_DIR}/hap

BASELINE_VCF_FILE_PATH1=${BASELINE_VCF_FILE_PATH_C}
BASELINE_BED_FILE_PATH1=${BASELINE_BED_FILE_PATH_C}
OUTPUT_VCF_FILE_PATH1=${OUTPUT_VCF_FILE_C}
HAPPY_PATH1=hap/${_SAMPLE_C}_happy


hap.py \
    ${_INPUT_DIR}/${BASELINE_VCF_FILE_PATH1} \
    ${_OUTPUT_DIR}/${OUTPUT_VCF_FILE_PATH1} \
    -f "${_INPUT_DIR}/${BASELINE_BED_FILE_PATH1}" \
    -r "${_REF}" \
    -o "${_OUTPUT_DIR}/${HAPPY_PATH1}" \
    --engine=vcfeval \
    --threads="8" \
    --pass-only

BASELINE_VCF_FILE_PATH2=${BASELINE_VCF_FILE_PATH_P1}
BASELINE_BED_FILE_PATH2=${BASELINE_BED_FILE_PATH_P1}
OUTPUT_VCF_FILE_PATH2=${OUTPUT_VCF_FILE_P1}
HAPPY_PATH2=hap/${_SAMPLE_P1}_happy

hap.py \
    ${_INPUT_DIR}/${BASELINE_VCF_FILE_PATH2} \
    ${_OUTPUT_DIR}/${OUTPUT_VCF_FILE_PATH2} \
    -f "${_INPUT_DIR}/${BASELINE_BED_FILE_PATH2}" \
    -r "${_REF}" \
    -o "${_OUTPUT_DIR}/${HAPPY_PATH2}" \
    --engine=vcfeval \
    --threads="8" \
    --pass-only


BASELINE_VCF_FILE_PATH3=${BASELINE_VCF_FILE_PATH_P2}
BASELINE_BED_FILE_PATH3=${BASELINE_BED_FILE_PATH_P2}
OUTPUT_VCF_FILE_PATH3=${OUTPUT_VCF_FILE_P2}
HAPPY_PATH3=hap/${_SAMPLE_P2}_happy

hap.py \
    ${_INPUT_DIR}/${BASELINE_VCF_FILE_PATH3} \
    ${_OUTPUT_DIR}/${OUTPUT_VCF_FILE_PATH3} \
    -f "${_INPUT_DIR}/${BASELINE_BED_FILE_PATH3}" \
    -r "${_REF}" \
    -o "${_OUTPUT_DIR}/${HAPPY_PATH3}" \
    --engine=vcfeval \
    --threads="8" \
    --pass-only
#10X
#python GetOverallMetrics.py --happy_vcf_fn=/data/testoutput/hap/HG002_happy.vcf.gz --output_fn=/data/testoutput/hap/HG002_metrics
#python GetOverallMetrics.py --happy_vcf_fn=/data/testoutput/hap/HG003_happy.vcf.gz --output_fn=/data/testoutput/hap/HG003_metrics
#python GetOverallMetrics.py --happy_vcf_fn=/data/testoutput/hap/HG004_happy.vcf.gz --output_fn=/data/testoutput/hap/HG004_metrics
