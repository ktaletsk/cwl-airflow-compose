# CWL-Airflow Using Docker Compose

Use this Docker Compose file to run Airflow 2.1.4 with CWL-Airflow 1.2.0 installed. The compose file will start a webserver, scheduler, and worker and all other necessary parts.
## Table of Contents

- [Configuration and Installation](#configuration-and-installation)
- [Running first CWL code](#running-first-cwl-code)
- [Features and Bugs](#features-and-bugs)

## Configuration and Installation

First, make sure that each containers can access persistant data via volumes. These specify locations in your local filesystem, managed by Docker.
+ Navigate to the .env to specify the location of your storage folders
+ *Create them inside your project home
+ Compose has been configured properly to create the necessary voulumes

Note: Other changes can be made inside of the Dockerfile in the cwl_airflow folder (for instance, author names and description etc.)

*** MAY NOT BE NECESSARY ***


If problems arise with missing folder errors, try the following...


Make sure that the folder locations are specefied inside airflow.cfg.
+ Navigate to airflow.cfg and include/update the parameters, at the bottom of the document, which specify the folder locations. After updating the file, copy the file back into the webserver container where it is used to initialize airflow and its many parameters.

***                      ***


Use the command

$ docker compose up --build


*Compose will create all volumes at run time if they do not already exist

## Running first CWL code

You will need two three things to run your first CWL script (more inputs and complexity in workflow many add more documents necessary)...
1. input/job
2. cwl workflow file
3. python-DAG file

Once uploaded successfully...
When triggering your DAG, use a .json job file to specify inputs. Select "trigger w/ configuration" inside of the Airflow UI. Also look to the CWL-Airflow "how-to-use.md" to learn about API usage. CWL-Airflow supplies its own API to execute DAGs with PUSH and accompanying job configuration.

For example, upperback is a simple workflow that takes a message, changes it to uppercase, reverses the text, and outputs the result (using inLineJaveRequrement, CommandLineTool, and ExpressionTool). It needs an input, specified upon running, like this:





## Features and Bugs

