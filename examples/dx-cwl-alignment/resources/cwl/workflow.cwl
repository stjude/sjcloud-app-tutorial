class: Workflow
cwlVersion: v1.0
id: workflow
label: workflow
$namespaces:
  sbg: 'https://www.sevenbridges.com/'
inputs:
  - id: read_two
    type: File
    'sbg:x': -657.39453125
    'sbg:y': -205
  - id: read_one
    type: File
    'sbg:x': -643.3848266601562
    'sbg:y': -63
  - id: genome
    type: string
    'sbg:x': -634.3848266601562
    'sbg:y': 71
  - id: reference
    type: Directory
    'sbg:x': -634.7105712890625
    'sbg:y': -404.2688903808594
outputs:
  - id: index
    outputSource:
      - samtools_index/index
    type: File
    'sbg:x': 423
    'sbg:y': -49
  - id: flagstat
    outputSource:
      - samtools_flagstat/flagstat
    type: File
    'sbg:x': 436
    'sbg:y': -201
  - id: out_bam
    outputSource:
      - samtools_sort/out_bam
    type: File
    'sbg:x': 338.8984375
    'sbg:y': -356.5
steps:
  - id: bwa
    in:
      - id: genome
        source: genome
      - id: read_one
        source: read_one
      - id: read_two
        source: read_two
      - id: reference
        source: reference
    out:
      - id: sam
    run: ./bwa.cwl
    label: bwa
    'sbg:x': -268.3984375
    'sbg:y': -132
  - id: samtools_convert_sam_to_bam
    in:
      - id: sam
        source: bwa/sam
    out:
      - id: bam
    run: ./samtools_convert_sam_to_bam.cwl
    label: samtools_convert_sam_to_bam
    'sbg:x': -51.80342102050781
    'sbg:y': -136.32781982421875
  - id: samtools_flagstat
    in:
      - id: bam
        source: samtools_sort/out_bam
    out:
      - id: flagstat
    run: ./samtools_flagstat.cwl
    label: samtools_flagstat
    'sbg:x': 245.6151123046875
    'sbg:y': -194
  - id: samtools_index
    in:
      - id: bam
        source: samtools_sort/out_bam
    out:
      - id: index
    run: ./samtools_index.cwl
    label: samtools_index
    'sbg:x': 238.6151123046875
    'sbg:y': -66
  - id: samtools_sort
    in:
      - id: in_bam
        source: samtools_convert_sam_to_bam/bam
    out:
      - id: out_bam
    run: ./samtools_sort.cwl
    label: samtools_sort
    'sbg:x': 94
    'sbg:y': -140
requirements: []
