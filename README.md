# CWL-Airflow Using Docker Compose

Use this Docker Compose file to run Airflow 2.1.4 with CWL-Airflow 1.2.0 installed. The compose file will start a webserver, scheduler, and worker and all other necessary parts.
## Table of Contents

- [Configuration and Installation](#configuration-and-installation)
- [Running first CWL workflow](#running-first-cwl-workflow)
- [Features and Bugs](#features-and-bugs)
- [More Complex and Tips](#More-Complex-and-Tips)

## Configuration and Installation

+ First, make sure that each containers can access persistant data via volumes. These specify locations in your local filesystem, managed by Docker.
    + Navigate to the .env to specify the location of your storage folders


        
    + If encountering problems with folder location, make sure that the folder locations are specefied inside airflow.cfg. Navigate to airflow.cfg and include/update the parameters, at the bottom of the document, which specify the folder locations. After updating the file, copy the file back into the webserver container where it is used to initialize airflow and its many parameters.


Use the command
***                      ***
$ docker compose up --build
***                      ***


Note: Compose will create all volumes at run time if they do not already exist. Additionally MySQL database and storage will also be created automatically upon building.

## Running first CWL workflow

You will need three things to run your first CWL script

1. upload your CWL file to your home directory
2. make a python file inside [dags](/dags) folder that uses CWLDAG library (example below)
    
***                      ***
#!/usr/bin/env python3
from cwl_airflow.extensions.cwldag import CWLDAG
dag = CWLDAG(
    workflow="/absolute/path/to/workflow.cwl",
    dag_id="my_dag_name"
)
***                      ***

3. upon runtime, indclude any necessary configuration parameters like "job" in a .json file
    + When triggering your DAG, use a .json job file to specify inputs. Select "trigger w/ configuration" inside of the Airflow UI. Also look to the CWL-Airflow "how-to-use.md" to learn about API usage. CWL-Airflow supplies its own API to execute DAGs with PUSH and accompanying job configuration.

        For example, upperback.cwl is a simple workflow that takes a message, changes it to uppercase, reverses the text, and outputs the result (using inLineJaveRequrement, CommandLineTool, and ExpressionTool). It needs an input, specified upon triggering, like this:
***                      ***
{
"job": {
"message": "whats up",
"scale": 1}
}
***                      ***






## Features and Bugs

+ [jobs](/jobs) folder is personal storage; it is not necessary to save in this location
+ Similarly, [dag_storage](/dag_storage) is a place to store and edit potential CWL code--however, DAGs inside of the [dags](/dags) folder may point to CWL script stored in this specific location

+ Inside this repository, some files are irrelevent (just reminence of my originial local file). "compressed_workflow.gz" and "compressed_workflow_base64.txt" are files that were used to PUSH a new CWL workflow to Airflow using the API.

The API request looked something like this:
***                      ***
$ curl -X POST \
  -H "Content-Type: application/json" \
  -d '{
    "workflow": "/Users/john.mcauliffe/documents/dag-storage/scatter.cwl",
    "workflow_content": "/Users/John.mcauliffe/documents/project1/compressed_workflow_base64.txt"
  }' \
  "http://localhost:8081/api/experimental/dags?dag_id=my_new_dag"
***                      ***

Common errors:
+ schema_salad.exceptions.ValidationException: Not found: '/Users/john.mcauliffe/documents/dag-storage/new.cwl'
    + fix: make sure your /path/to/dag is inside the same project folder like it is here.
+ FileNotFoundError: [Errno 2] No such file or directory: '/Users/john.mcauliffe/documents/project1/cwl_pickle_folder/3c18fa08f8beabcef4278a5f54503482.p'
    + fix: this error is similar to the above mention; make sure all PATHs are correct and local file organization is correct for all documents including your "dag.py"
+ recursion reached maximum depth error
    + fix: try debugging your python operator; the problem is likely with incorrect syntax inside a _python_ file


## More Complex and Tips

+ Try using the [TriggerDagRunOperator](https://github.com/apache/airflow/blob/main/airflow/operators/trigger_dagrun.py) to compile multiple DAGs into one DAG
    + See combine.py for an example of this operator in use

+ Another useful tool inside Airflow: Sensor Operators. These Operators can be used to monitor the behavior of other tasks and DAGs; they can execute functions only when certain criteria are met (e.g. the successful completetion of another task)
    + Check out the [ExternalTaskSensor](https://github.com/apache/airflow/blob/39aee60b33a56eee706af084ed1c600b12a0dd57/airflow/sensors/external_task.py) Operator that I use in [sensor_example.py](/dag_storage/sensor_example.py)
    + In this example, the sensors are referencing tasks from an external DAG, hence the operator name, however the same operator, and other sensor operators, can be used more simply inside the DAG their monitoring
    + They can be used to check task status, outputs, inputs, and configuration





