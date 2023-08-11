# I want a sensor to look at a DAG that import CWL code

# The DAG looks like this: CWLJobDispatcher, echo, uppercase, CWLJobGatherer

# so, sense when the first task returns success status, then when the last task does
# at each instance , print "successful start" and "successfully end" respectively

# dag_id = my_dag
# task1 = CWLJobDispatcher
# task2 = CWLJobGatherer


# Here, I am writing a DAG in python WITHOUT setting up any dependencies between them

from airflow import DAG
from airflow.sensors.external_task import ExternalTaskSensor
from datetime import datetime, timedelta

default_args = {
    'owner': 'airflow',
    'start_date': datetime(2023, 8, 11),
    'depends_on_past': False,
    'retries': 1,
    'retry_delay': timedelta(minutes=1),
}

dag = DAG(
    'example_external_sensor_dag',
    default_args=default_args,
    schedule_interval=None,  # Set to None if you want to trigger the DAG manually
    catchup=False,
)

# Define your ExternalTaskSensors here
sensor_task_1 = ExternalTaskSensor(
    task_id='sensor_task_1',
    external_dag_id='my_dag',  # Replace with the target DAG ID
    external_task_id='CWLJobDispatcher',  # Replace with the target task ID
    # mode='reschedule',  # Options: 'poke', 'reschedule', 'upstream' (poke by default)
    timeout=3600,  # Set the timeout value as needed
    poke_interval=30  # Set the poke interval as needed
)

sensor_task_2 = ExternalTaskSensor(
    task_id='sensor_task_2',
    external_dag_id='my_dag',  # Replace with the target DAG ID
    external_task_id='CWLJobGatherer',  # Replace with the target task ID
    # mode='reschedule',  # Options: 'poke', 'reschedule', 'upstream' (poke by default)
    timeout=3600,  # Set the timeout value as needed
    poke_interval=30  # Set the poke interval as needed
)

# There's no explicit dependency between sensor_task_1 and sensor_task_2
# They will run concurrently since there's no defined order between them
