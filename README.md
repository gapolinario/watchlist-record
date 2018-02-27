# watchlist-record
Track numbers of movies in my Letterboxd watchlist over time

Create a file called `folder` and the content of this file
is the path to the directory where you are going to 
store your data.
If this file does not exist, create record file
at the same directory.

Add the file called `watchlist-sh`, in this folder, to `/etc/cron.weekly`
(or daily, according to your movie watching frequency)

## To do

- Daily updates still don't work
- watchlist-sh file is old and does not work
- Use config file instead of folder and user
- Start command should ask for folder and username, this simplifies the makefile

Here is my watchlist as a graph:

![My watchlist record](https://github.com/gapolinario/watchlist-record/blob/master/watchGraph.pdf "My watchlist record")

