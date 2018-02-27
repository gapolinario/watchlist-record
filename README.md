# Watchlist Record

Track numbers of movies in my Letterboxd watchlist over time

## How to

Navigate to this project folder, on your computer and
run its configuration:

```bash
make start
```

The configuration will ask for your Letterboxd username
and a folde where to store the files,
you can type "./" if you want to store the files
in the same folder as the code,
or another file, like "~/Documents/Letterboxd/",
for instance.

Add the file called `watchlist-sh`, in this folder, to `/etc/cron.weekly`
(or daily, according to your movie watching frequency)

## To do

- Daily updates still don't work
- watchlist-sh file is old and does not work

Here is my watchlist as a graph:

![My watchlist record](https://github.com/gapolinario/watchlist-record/blob/master/watchGraph.png "My watchlist record")

