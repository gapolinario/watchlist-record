folder := $(shell grep folder config | awk '{print $$2}')
user   := $(shell grep user config | awk '{print $$2}')

.PHONY: all
## all : update record and plot it
all: update graph

.PHONY: graph
## graph : plot the watchlist record
graph:
	python graph_record.py $(folder)

.PHONY: update
## update : update watchlist record
update:
	python add_record.py $(folder) $(user)

.PHONY: start
## start : start or reset watchlist record
start:
	bash start.sh

.PHONY: help
help: makefile
	@sed -n 's/^##//p' $<
