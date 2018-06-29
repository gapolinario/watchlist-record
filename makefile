folder := $(shell grep folder config | awk '{print $$2}')
user   := $(shell grep user config | awk '{print $$2}')

data=watchRecord.csv
figure=watchGraph

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
	convert -density 300 $(folder)$(figure).pdf -quality 100 $(shell pwd)/$(figure).png

.PHONY: graph
## graph : plot the watchlist record
graph:
	python graph_record.py $(folder)

.PHONY: update
## update : update watchlist record
update:
	python add_record.py $(folder) $(user)
	cp $(folder)/$(data) $(folder)$(data).bup

.PHONY: dupes
## dupes : remove lines with the same date, keeps only the first entry
dupes:
	awk -F ',' '!seen[$$1]++' $(folder)$(data) > tmp
	cp tmp $(folder)$(data)
	rm tmp
	cp $(folder)$(data) $(folder)$(dat).bup


# OTHERS

.PHONY: help
help: makefile
	@sed -n 's/^##//p' $<
