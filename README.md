# tabula-docker

Script to build docker images for Tabula releases using [Eclipse
Temurin](https://projects.eclipse.org/projects/adoptium.temurin).

## Running

First time, create and run the container (1.2.1 is the last available version):

```shell
docker run \
	--name tabula \
	-p 5000:5000 \
	-d \
	turicas/tabula:1.2.1
```

Then, access [localhost:5000](http://localhost:5000/).

To stop:

```shell
docker stop tabula
```

Start again:

```shell
docker start tabula
```


### Customizing

You can change `java`'s `-Xms` and `-Xmx` values and binding port by passing
environment variables:

```shell
docker run \
	--name tabula \
	-p 5001:5001 \
	-e PORT=5001 \
	-e JAVA_XMS="256M" \
	-e JAVA_XMX="1024M" \
	-d \
	turicas/tabula:1.2.1
```


## Building

```shell
./build.sh [git_tag]
```

## Versions

The script can build only [Tabula
releases](https://github.com/tabulapdf/tabula/releases) with a JAR available.

Some of the old versions are raising `java.lang.ExceptionInInitializerError`
when started (this was not fixed in these images).
