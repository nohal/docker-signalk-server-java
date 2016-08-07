# About this Repo

This is the Git repo of the Docker image for [signalk-server-java](https://hub.docker.com/r/nohal/signalk-server-java/). See [the Docker Hub page](https://hub.docker.com/r/nohal/signalk-server-java/) for the full readme on how to use this Docker image and for information regarding contributing and issues.

## Image deployment: 
docker pull nohal/signalk-server-java

## About
[SignalK](http://signalk.org) is an open protocol for universal marine data exchange. This image allows for trivial installation of [signalk-server-java](https://github.com/SignalK/signalk-java), the reference implementation in Java.

## Configuration
By default the image is configured to play the sample NMEA data from file.

## Running:
### The most trivial example
```docker run -d nohal/signalk-server-java```

### Expose the server on local ports
```docker run -d -p3000:3000 -p1883:1883 -p8080:8080 -p55554:55554 -p55555:55555 -p55556:55556 -p55557:55557 -p61613:61613 nohal/signalk-server-java```
