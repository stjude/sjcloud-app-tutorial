class: CommandLineTool
cwlVersion: v1.0
id: bwa
baseCommand:
  - bwa
  - mem
inputs:
  - id: genome
    type: string
  - id: read_one
    type: File
    inputBinding:
      position: 1
  - id: read_two
    type: File
    inputBinding:
      position: 2
  - id: reference
    type: Directory
    inputBinding:
      position: 0
      valueFrom: $(inputs.reference.path)/$(inputs.genome)
outputs:
  - id: sam
    type: File
    outputBinding:
      glob: out.sam
label: bwa
arguments:
  - position: 0
    prefix: '-t'
    valueFrom: '4'
requirements:
  - class: ResourceRequirement
    ramMin: 8000
    coresMin: 0
  - class: DockerRequirement
    dockerPull: bio-base
  - class: InlineJavascriptRequirement
stdout: out.sam
