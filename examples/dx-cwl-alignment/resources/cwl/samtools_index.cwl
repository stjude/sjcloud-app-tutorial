class: CommandLineTool
cwlVersion: v1.0
id: samtools_index
baseCommand:
  - samtools
  - index
inputs:
  - id: bam
    type: File
    inputBinding:
      position: 0
outputs:
  - id: index
    type: File
    outputBinding:
      glob: $(inputs.bam.basename).bai
label: samtools_index
requirements:
  - class: ResourceRequirement
    ramMin: 8000
    coresMin: 0
  - class: DockerRequirement
    dockerPull: bio-base
  - class: InlineJavascriptRequirement
  - class: InitialWorkDirRequirement
    listing: 
      - $(inputs.bam)
