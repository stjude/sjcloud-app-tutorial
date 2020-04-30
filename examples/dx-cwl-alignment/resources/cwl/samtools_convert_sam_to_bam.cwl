class: CommandLineTool
cwlVersion: v1.0
id: samtools_convert_sam_to_bam
baseCommand:
  - samtools
  - view
inputs:
  - id: sam
    type: File
    inputBinding:
      position: 0
outputs:
  - id: bam
    type: File
    outputBinding:
      glob: out.bam
label: samtools_convert_sam_to_bam
arguments:
  - position: 0
    prefix: ''
    separate: false
    shellQuote: false
    valueFrom: '-Sb'
requirements:
  - class: ShellCommandRequirement
  - class: ResourceRequirement
    ramMin: 4000
    coresMin: 0
  - class: DockerRequirement
    dockerPull: bio-base
stdout: out.bam
