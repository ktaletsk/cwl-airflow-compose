{
    "cwlVersion": "v1.2",
    "class": "Workflow",
    "requirements": [
        {
            "class": "InlineJavascriptRequirement"
        }
    ],
    "inputs": [
        {
            "id": "uppercase_uppercase_message",
            "type": "string"
        }
    ],
    "outputs": [
        {
            "id": "reverse_reversed_message",
            "type": "string",
            "outputSource": "reverse/reversed_message"
        }
    ],
    "steps": [
        {
            "run": {
                "class": "ExpressionTool",
                "requirements": [
                    {
                        "class": "InlineJavascriptRequirement"
                    }
                ],
                "inputs": [
                    {
                        "type": "string",
                        "id": "file:///Users/john.mcauliffe/documents/project1/dag_storage/upperback.cwl#reverse/run/message"
                    }
                ],
                "outputs": [
                    {
                        "type": "string",
                        "id": "file:///Users/john.mcauliffe/documents/project1/dag_storage/upperback.cwl#reverse/run/reversed_message"
                    }
                ],
                "expression": "${ \n  var reversedText = inputs.message.split('').reverse().join('');\n  return {\"reversed_message\": reversedText}; \n}\n",
                "id": "_:c791af45-ffab-478c-a391-c0511e658cdb"
            },
            "in": [
                {
                    "source": "uppercase_uppercase_message",
                    "id": "file:///Users/john.mcauliffe/documents/project1/dag_storage/upperback.cwl#reverse/message"
                }
            ],
            "out": [
                "file:///Users/john.mcauliffe/documents/project1/dag_storage/upperback.cwl#reverse/reversed_message"
            ],
            "id": "file:///Users/john.mcauliffe/documents/project1/dag_storage/upperback.cwl#reverse"
        }
    ],
    "id": "file:///Users/john.mcauliffe/documents/project1/dag_storage/upperback.cwl",
    "http://commonwl.org/cwltool#original_cwlVersion": "v1.2"
}