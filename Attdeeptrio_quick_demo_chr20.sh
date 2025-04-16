
_INPUT_DIR="./data"
#输入文件夹


#输出文件夹

#model_path_clair3：The folder path containing a Clair3 model (requiring six files in the folder, including pileup.data-00000-of-00002, pileup.data-00001-of-00002 pileup.index, full_alignment.data-00000-of-00002, full_alignment.data-00001-of-00002  and full_alignment.index.)

##model_path_clair3_trio: The folder path containing a Attdeeptrio-Trio model.(requiring two files in the folder, including trio.data-00000-of-00001,trio.index)

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