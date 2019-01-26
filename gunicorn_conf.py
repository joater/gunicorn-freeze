import os

worker_class = os.environ['WORKER_CLASS']
workers = os.environ['NUM_WORKERS']

backlog = os.environ['BACKLOG']
timeout = os.environ['TIMEOUT']

accesslog = '/accesslog.log'
errorlog = '/errorlog.log'