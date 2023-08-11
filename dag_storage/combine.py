from airflow import DAG
from airflow.operators.trigger_dagrun import TriggerDagRunOperator
from datetime import datetime
from airflow.operators.python_operator import PythonOperator


default_args = {
    'owner': 'airflow',
    'depends_on_past': False,
    'start_date': datetime(2023, 8, 11),
    # Add other default arguments as needed
}

dag = DAG(
    'my_trigger_dag',
    default_args=default_args,
    schedule_interval=None,  # Set your desired schedule interval
    catchup=False,
)

trigger_task = TriggerDagRunOperator(
    task_id='trigger_task',
    trigger_dag_id="my_dag",  # Replace with the ID of the target DAG
    provide_context=True,
    conf={
        "job": {
            "message": "whats_up",
            "scale": 1
        }
    },  # Configuration to pass to the triggered DAG
)

def my_python_function(**kwargs):
    # Your Python task logic here
    print("Executing the new_task...")

new_task = PythonOperator(
    task_id='new_task',
    python_callable=my_python_function,
    provide_context=True,
)


trigger_task >> new_task