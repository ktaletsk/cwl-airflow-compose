# CWL-Airflow Using Docker Compose

Use this Docker Compose file to run Airflow 2.1.4 with CWL-Airflow 1.2.0 installed. The compose file will start a webserver, scheduler, and worker and all other necessary parts.
## Table of Contents

- [Configuration and Installation](#Configuration and Installation)
- [Running first CWL code](#Running first CWL code)
- [Features and Bugs](#Features and Bugs)

## Configuration and Installation

First, make sure that each containers can access persistant data via volumes. These specify locations in your local filesystem, managed by Docker.
  - Navigate to the .env to specify the location of your storage folders
  - *Create them inside your project home
  - Compose has been configured properly to create the necessary voulumes

Note: Other changes can be made inside of the Dockerfile in the cwl_airflow folder (for instance, author names and description etc.)

*** MAY NOT BE NECESSARY ***


If problems arise with missing folder errors, try the following...


Make sure that the folder locations are specefied inside airflow.cfg.
-Navigate to airflow.cfg and include/update the parameters, at the bottom of the document, which specify the folder locations. After updating the file, copy the file back into the webserver container where it is used to initialize airflow and its many parameters.

***                      ***


Use the command

$ docker compose up --build


*Compose will create all volumes at run time if they do not already exist

## Running first CWL code


## Features and Bugs

