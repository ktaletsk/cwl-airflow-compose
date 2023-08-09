#!/usr/bin/env python3
from cwl_airflow.extensions.cwldag import CWLDAG
dag = CWLDAG(
    workflow="/Users/john.mcauliffe/documents/dag-storage/new.cwl",
    dag_id="my_dag"
)
