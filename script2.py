import warnings; warnings.simplefilter(action='ignore', category=FutureWarning)
import dask_jobqueue
from distributed import Client
from contextlib import suppress 
import platform; print( platform.python_version () )

with suppress(Exception):
    client.shutdown()

cluster = dask_jobqueue.SLURMCluster(
            queue = 'all', 
            processes=1,
            cores=8, 
            memory='1GB',
            scheduler_options={'dashboard_address': ':8087'},
            death_timeout=120 # seconds
          )

client = Client(cluster, timeout="120s")
print(client.cluster)

client.cluster.scale(8)
print(client.cluster)

print(cluster.job_script())

import dask.bag as db

def bag_map(x):
    import platform, socket; 
    version = platform.python_version() 
    ip      = socket.gethostbyname(socket.gethostname()) 
    return (ip, version)

data = list(range(1,16+1))
b = db.from_sequence(data, npartitions=len(data))
print(b)

bm = b.map(bag_map)
bmc = bm.compute()
print(set(bmc), bmc)

