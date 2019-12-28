folder := $(shell grep folder config | awk '{print $$2}')
user   := $(shell grep user config | awk '{print $$2}')

data=watchRecord.csv
figure=watchGraph

# AUTO

.PHONY: all
## all : update record and plot it
all: update graph

# SETUP STAGE

.PHONY: start
## start : start or reset watchlist record
# not tested
start:
	echo "this action resets all records, are you sure? [y/n]"
	read p
	case $p in
	        y)
	                bash start.sh
	        ;;
	        n)
	                printf 'Aborted by user\n'
	        ;;
	        *)
	                printf 'Options are y/n\n'
	esac

.PHONY: anacron
## anacron : setup daily updates with anacrontab (requires sudo)
anacron:
	printf "%c%c%s\n%s\n" "#" "!" "/bin/bash" "make -C $(shell pwd) all" > $(folder)/watchlist
	cp $(folder)/watchlist /etc/cron.daily
	chmod +x /etc/cron.daily/watchlist

# RUNNING STAGE

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
