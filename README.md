# Docker Image for JavaFX

## Description

Docker Image for JavaFX.

## Setup

```console
$ docker-compose build
```

## Usage (Run HelloWorld using JavaFX SDK)

```console
$ ./run.sh
$ mkdir -p sample/src
$ cd sample/src/
$ wget https://raw.githubusercontent.com/openjfx/samples/9244c1f2df35f6c1bdddbdc83b48da75af378481/HelloFX/CLI/hellofx/HelloFX.java
$ javac --module-path $PATH_TO_FX --add-modules javafx.controls HelloFX.java
$ java --module-path $PATH_TO_FX --add-modules javafx.controls HelloFX
```

## References

* [Getting Started with JavaFX](https://openjfx.io/openjfx-docs/#install-javafx)
* [JavaFX - Gluon](https://gluonhq.com/products/javafx/)
* [openjdk Tags | Docker Hub](https://hub.docker.com/_/openjdk/tags?page=1&name=bullseye)

## License

* MIT
