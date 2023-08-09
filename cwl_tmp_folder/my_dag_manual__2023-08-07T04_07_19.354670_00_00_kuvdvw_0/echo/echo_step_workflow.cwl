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
                        "id": "file:///Users/john.mcauliffe/documents/project1/dag_storage/new_dag.cwl#echo/run/message"
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
                        "id": "file:///Users/john.mcauliffe/documents/project1/dag_storage/new_dag.cwl#echo/run/out"
                    }
                ],
                "id": "_:caa2b12f-d165-47c0-b7f3-e0d4faddb8ba"
            },
            "in": [
                {
                    "source": "message",
                    "id": "file:///Users/john.mcauliffe/documents/project1/dag_storage/new_dag.cwl#echo/message"
                }
            ],
            "out": [
                "file:///Users/john.mcauliffe/documents/project1/dag_storage/new_dag.cwl#echo/out"
            ],
            "id": "file:///Users/john.mcauliffe/documents/project1/dag_storage/new_dag.cwl#echo"
        }
    ],
    "id": "file:///Users/john.mcauliffe/documents/project1/dag_storage/new_dag.cwl",
    "http://commonwl.org/cwltool#original_cwlVersion": "v1.2"
}