class: CommandLineTool
cwlVersion: v1.0
id: samtools_sort
baseCommand:
  - samtools
  - sort
inputs:
  - id: in_bam
    type: File
    inputBinding:
      position: 2
outputs:
  - id: out_bam
    type: File
    outputBinding:
      glob: $(inputs.in_bam.nameroot).sorted.bam
label: samtools_sort
arguments:
  - position: 0
    prefix: '-o'
    valueFrom: $(inputs.in_bam.nameroot).sorted.bam
  - position: 0
    prefix: '-O'
    valueFrom: BAM
requirements:
  - class: ResourceRequirement
    ramMin: 2000
    coresMin: 0
  - class: DockerRequirement
    dockerPull: bio-base
  - class: InlineJavascriptRequirement
