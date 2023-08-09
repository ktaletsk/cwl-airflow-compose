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
                        "id": "file:///Users/john.mcauliffe/documents/project1/dag_storage/new_dag.cwl#uppercase/run/message"
                    }
                ],
                "outputs": [
                    {
                        "type": "string",
                        "id": "file:///Users/john.mcauliffe/documents/project1/dag_storage/new_dag.cwl#uppercase/run/uppercase_message"
                    }
                ],
                "expression": "${ return {\"uppercase_message\": inputs.message.toUpperCase()}; }\n",
                "id": "_:b78eebb9-7de3-47a1-a7ee-7d04393c87c3"
            },
            "in": [
                {
                    "source": "echo_out",
                    "id": "file:///Users/john.mcauliffe/documents/project1/dag_storage/new_dag.cwl#uppercase/message"
                }
            ],
            "out": [
                "file:///Users/john.mcauliffe/documents/project1/dag_storage/new_dag.cwl#uppercase/uppercase_message"
            ],
            "id": "file:///Users/john.mcauliffe/documents/project1/dag_storage/new_dag.cwl#uppercase"
        }
    ],
    "id": "file:///Users/john.mcauliffe/documents/project1/dag_storage/new_dag.cwl",
    "http://commonwl.org/cwltool#original_cwlVersion": "v1.2"
}