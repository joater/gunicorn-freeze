The app is dockerized, so the only thing that you should do to run the app is:

sudo docker-compose up


For running the script, open a new terminal, go to "tests" folder, and then execute the following:

k6 run --no-usage-report script.js

The test is set to run with 10 Virtual Users, with a duration of 20 seconds.


Procedure for reproducing Gunicorn freeze:

Use 1 or 2 cores for Docker.
Before running tests, execute docker stats for visualizing container stats.
Run k6 inmmediately after k6 script finishes (that is to say, leave 0 seconds between tests/commands (k6 run --no-usage-report script.js)).
While running k6, observe docker stats. In some moment, gunicorn will hang and CPU usage will drop. Wait some seconds, and gunicorn will start consuming more CPU.

Run as many tests as necesary until this behaviour appears.