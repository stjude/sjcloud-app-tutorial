class: CommandLineTool
cwlVersion: v1.0
id: samtools_flagstat
baseCommand:
  - samtools
  - flagstat
inputs:
  - id: bam
    type: File
    inputBinding:
      position: 0
outputs:
  - id: flagstat
    type: File
    outputBinding:
      glob: '*.flagstat.txt'
label: samtools_flagstat
requirements:
  - class: ResourceRequirement
    ramMin: 2000
    coresMin: 0
  - class: DockerRequirement
    dockerPull: bio-base
  - class: InlineJavascriptRequirement
stdout: $(inputs.bam.basename).flagstat.txt
