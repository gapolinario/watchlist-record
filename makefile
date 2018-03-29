folder := $(shell grep folder config | awk '{print $$2}')
user   := $(shell grep user config | awk '{print $$2}')

# SETUP STAGE

.PHONY: start
## start : start or reset watchlist record
start:
	bash start.sh

.PHONY: anacron
## anacron : setup daily updates with anacrontab (requires sudo)
anacron:
	printf "%c%c%s\n%s\n" "#" "!" "/bin/bash" "make -C $(shell pwd) all" > $(folder)/watchlist
	cp $(folder)/watchlist /etc/cron.daily
	chmod +x /etc/cron.daily/watchlist

# RUNNING STAGE

.PHONY: all
## all : update record and plot it
all: update graph

.PHONY: png
## png : copy plot image from folder and update Github figure
png:
	convert -density 300 $(folder)/watchGraph.pdf -quality 100 $(shell pwd)/watchGraph.png

.PHONY: graph
## graph : plot the watchlist record
graph:
	python graph_record.py $(folder)

.PHONY: update
## update : update watchlist record
update:
	python add_record.py $(folder) $(user)
	cp $(folder)/watchRecord.csv $(folder)/watchRecord.csv.bup

.PHONY: dupes
## dupes : remove lines with the same date
dupes:
	@echo "I still don't know how to do this"

# OTHERS

.PHONY: help
help: makefile
	@sed -n 's/^##//p' $<