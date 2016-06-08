Docker NFSEN
============

NFSEN is a frontent to NFDUMP. It is used to collect and process NetFlow data from network devices.

How to run
----------

You can use ./run.sh or write your own startup:

	docker run -d -h netflow --name netflow -e NFSEN_SOURCES="uplink1,9995,#ff0000:uplink2,9996,#00ff00" -p 8080:80 -p 9995-9996:9995-9996/udp -v `pwd`/data:/data netflow "$@"

NFSEN_SOURCES defines NetFlow sources.
Each source has 3 fields: name, port, color. Multiple sources are separated by collon.
Do not forget to bind extra UDP ports and a data folder where nfdump and nfsen store their data.
