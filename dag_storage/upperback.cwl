cwlVersion: v1.2
class: Workflow

requirements:
  InlineJavascriptRequirement: {}

inputs:
  message: string

outputs:
  out:
    type: string
    outputSource: reverse/reversed_message

steps:
  echo:
    run:
      class: CommandLineTool
      baseCommand: echo
      stdout: output.txt
      inputs:
        message:
          type: string
          inputBinding: {}
      outputs:
        out:
          type: string
          outputBinding:
            glob: output.txt
            loadContents: true
            outputEval: $(self[0].contents)
    in:
      message: message
    out: [out]

  uppercase:
    run:
      class: ExpressionTool
      requirements:
        InlineJavascriptRequirement: {}
      inputs:
        message: string
      outputs:
        uppercase_message: string
      expression: |
        ${ return {"uppercase_message": inputs.message.toUpperCase()}; }
    in:
      message: echo/out
    out: [uppercase_message]

  reverse:
    run:
      class: ExpressionTool
      requirements:
        InlineJavascriptRequirement: {}
      inputs:
        message: string
      outputs:
        reversed_message: string
      expression: |
        ${ 
          var reversedText = inputs.message.split('').reverse().join('');
          return {"reversed_message": reversedText}; 
        }
    in:
      message: uppercase/uppercase_message
    out: [reversed_message]
