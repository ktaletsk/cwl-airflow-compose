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
            "id": "echo_out",
            "type": "string"
        }
    ],
    "outputs": [
        {
            "id": "uppercase_uppercase_message",
            "type": "string",
            "outputSource": "uppercase/uppercase_message"
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
                        "id": "file:///Users/john.mcauliffe/documents/project1/dag_storage/upperback.cwl#uppercase/run/message"
                    }
                ],
                "outputs": [
                    {
                        "type": "string",
                        "id": "file:///Users/john.mcauliffe/documents/project1/dag_storage/upperback.cwl#uppercase/run/uppercase_message"
                    }
                ],
                "expression": "${ return {\"uppercase_message\": inputs.message.toUpperCase()}; }\n",
                "id": "_:0f566d5f-da24-4545-a4d1-acbb3303e131"
            },
            "in": [
                {
                    "source": "echo_out",
                    "id": "file:///Users/john.mcauliffe/documents/project1/dag_storage/upperback.cwl#uppercase/message"
                }
            ],
            "out": [
                "file:///Users/john.mcauliffe/documents/project1/dag_storage/upperback.cwl#uppercase/uppercase_message"
            ],
            "id": "file:///Users/john.mcauliffe/documents/project1/dag_storage/upperback.cwl#uppercase"
        }
    ],
    "id": "file:///Users/john.mcauliffe/documents/project1/dag_storage/upperback.cwl",
    "http://commonwl.org/cwltool#original_cwlVersion": "v1.2"
}