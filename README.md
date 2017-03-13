This is docker image to try out Hyku implementation for evaluation purposes only.


There are still a few bugs to work out at this time, but image is stable an workable (I hope... )

Current docker-compose setup exposes redis, solr and fedora ports to localhost, therefore to run it
you have to make ensure that you are not running those services.
for Ubuntu run
$service --status-all
to show all running services

to see what is listening on the all ports:
$netstat -tulpn
optionally pipe it into grep and search for ports
$netstat -tulpn | grep 8983

if you do not wish to expose those ports please comment/remove following lines from docker-compose.yml file

      - 6379:6379
      - 8983:8983
      - 8984:8984

Now just run:

$docker-compose up

in the directory where docker-compose.yml files is located.
It will take long time first time to stat up as lots of docker images will be downloaded.
After all the messages stop scrolling on the console, just point your browser to localhost:3000


