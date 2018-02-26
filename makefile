fexists := $(shell [ -f folder ] && echo 1 || echo 0)

ifeq ($(fexists),1)
        folder := $(shell cat folder)
else
        folder := ./
endif

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
	python add_record.py $(folder)

.PHONY: start
## start : start or reset watchlist record
start:
	bash start.sh $(folder)

.PHONY: #help
help : makefile
	@sed -n 's/^##//p' $<