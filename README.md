# Prometheus Exporter - Docker mod for transmission

This mod adds a prometheus exporter to transmission, to serve metrics while the container is running.

In transmission docker arguments, set an environment variable `DOCKER_MODS=linuxserver/mods:transmission-prometheus-exporter`

If adding multiple mods, enter them in an array separated by `|`, such as `DOCKER_MODS=linuxserver/mods:transmission-prometheus-exporter|linuxserver/mods:transmission-mod2`
