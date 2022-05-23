import time

from dask.distributed import Client
from dask_jobqueue import SLURMCluster
cluster = SLURMCluster(cores=5, processes=1, memory="800M")
client = Client(cluster)

cluster.scale(jobs=5)
print(cluster.job_script())

import os
from pathlib import Path

# Make sure your file is somewhere with mounted storage across all nodes
home = str(Path.home())
file_name = os.path.join(home, 'dask-jobqueue-info.txt')

def print_env(x):
    with open(file_name, 'a') as myfile:
        myfile.write(f'{os.getenv("HOSTNAME")} {x}\n')
    return x*x

futures = client.map(print_env, range(100))
time.sleep(10)
results = client.gather(futures)
time.sleep(10)
print(len(results))
