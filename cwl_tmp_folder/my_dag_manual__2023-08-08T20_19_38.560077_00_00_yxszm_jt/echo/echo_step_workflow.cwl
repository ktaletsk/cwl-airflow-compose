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
            "id": "message",
            "type": "string"
        }
    ],
    "outputs": [
        {
            "id": "echo_out",
            "type": "string",
            "outputSource": "echo/out"
        }
    ],
    "steps": [
        {
            "run": {
                "class": "CommandLineTool",
                "baseCommand": "echo",
                "stdout": "output.txt",
                "inputs": [
                    {
                        "type": "string",
                        "inputBinding": {},
                        "id": "file:///Users/john.mcauliffe/documents/project1/dag_storage/upperback.cwl#echo/run/message"
                    }
                ],
                "outputs": [
                    {
                        "type": "string",
                        "outputBinding": {
                            "glob": "output.txt",
                            "loadContents": true,
                            "outputEval": "$(self[0].contents)"
                        },
                        "id": "file:///Users/john.mcauliffe/documents/project1/dag_storage/upperback.cwl#echo/run/out"
                    }
                ],
                "id": "_:d8ec6ebb-d142-4056-b8b7-e0b9ea0bc5ec"
            },
            "in": [
                {
                    "source": "message",
                    "id": "file:///Users/john.mcauliffe/documents/project1/dag_storage/upperback.cwl#echo/message"
                }
            ],
            "out": [
                "file:///Users/john.mcauliffe/documents/project1/dag_storage/upperback.cwl#echo/out"
            ],
            "id": "file:///Users/john.mcauliffe/documents/project1/dag_storage/upperback.cwl#echo"
        }
    ],
    "id": "file:///Users/john.mcauliffe/documents/project1/dag_storage/upperback.cwl",
    "http://commonwl.org/cwltool#original_cwlVersion": "v1.2"
}