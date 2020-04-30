class: Workflow
cwlVersion: v1.0
id: workflow
label: workflow
inputs:
  - id: read_two
    type: File
  - id: read_one
    type: File
  - id: genome
    type: string
  - id: reference
    type: Directory
outputs:
  - id: index
    outputSource:
      - samtools_index/index
    type: File
  - id: flagstat
    outputSource:
      - samtools_flagstat/flagstat
    type: File
  - id: out_bam
    outputSource:
      - samtools_sort/out_bam
    type: File
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
  - id: samtools_convert_sam_to_bam
    in:
      - id: sam
        source: bwa/sam
    out:
      - id: bam
    run: ./samtools_convert_sam_to_bam.cwl
    label: samtools_convert_sam_to_bam
  - id: samtools_flagstat
    in:
      - id: bam
        source: samtools_sort/out_bam
    out:
      - id: flagstat
    run: ./samtools_flagstat.cwl
    label: samtools_flagstat
  - id: samtools_index
    in:
      - id: bam
        source: samtools_sort/out_bam
    out:
      - id: index
    run: ./samtools_index.cwl
    label: samtools_index
  - id: samtools_sort
    in:
      - id: in_bam
        source: samtools_convert_sam_to_bam/bam
    out:
      - id: out_bam
    run: ./samtools_sort.cwl
    label: samtools_sort
requirements: []
