# TCR-rep


We conducted high-throughput T cell receptor (TCR) β repertoire sequencing to investigate peripheral TCR profiles and SARS-CoV-2-associated TCR clonotypes among 192 COVID-19 patients with moderate, severe, or critical disease and 81 healthy controls. 

<hr>

## Preprocessing of raw amplicon PCR sequencing data and alignment to ImMunoGeneTics (IMGT) database

### Filter the raw sequencing data
cutadapt -a GATCGGAAGAGCACACGTCTGAACTCCAGTCACATCACGATCTCGTATGCCGTCTTCTGCTTG -A AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGTAGATCTCGGTGGTCGCCGTATCATT -o out.1.fq -p out.2.fq 18R000871_R150_MPCR_R1.fq.gz 18R000871_R150_MPCR_R2.fq.gz -m 60 --pair-filter=both -j 10 --max-n=0.05 -q 20,20 

### TCR clonotype identification

/xtdisk/liufan_group/yuanna/TCR/MixCR/mixcr-3.0.13/mixcr analyze amplicon --species hsa --starting-material dna --5-end v-primers  --3-end j-primers  --adapters adapters-present  --receptor-type TRB  -t 5  cleandata/19C169163/19C169163.clean_R1.fq.gz cleandata/19C169163/19C169163.clean_R2.fq.gz ./mixcr_result/19C169163

## COVID-19 associated TCRβ identification

The detection rate of each clone in HC group and COVID-19 group was calculated (that is, the number of samples detected in the clone), which were recorded as cC and cD, and the non-detection rate in the corresponding group, recorded as cnC and cnD, respectively. 

(1) Large panel :284 clones related to COVID-19 were identified under the threshold of RR>1 and FDR<1e-5. 

(2) Middle panel :102 clones related to COVID-19 were identified under the threshold of RR>1 and FDR<1e-6. 
 
(3) Mini panel: Under stricter threshold conditions: RR>1 and FDR<1e-8, 12 clones related to COVID-19 that are significantly different from the HC group were identified in the COVID-19 group.
