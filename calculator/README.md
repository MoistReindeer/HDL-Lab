# Taschenrechner

## Simulation

Simuliert können verschiedene Testbenches aus dem Ordner testbench.
Eine Simulation kann wie folgt durchgeführt werden:
```
# Um den Taschenrechner zu simulieren
$ make

# Um ein bestimmtest Modul zu simulieren
$ make ./build/<<modulname>>.fst
```

## Bitstream Generation

Um den Bitstream zu generieren, ist das Submodul der [f4pga-examples](https://github.com/chipsalliance/f4pga-examples) notwendig und die F4PGA Umgebung.
```
# Aktualisiert das git-submodule
$ git submodule update --init

# Aktivieren der Umgebung
$ export F4PGA_INSTALL_DIR=/opt/f4pga
$ source "$F4PGA_INSTALL_DIR/$FPGA_FAM/conda/etc/profile.d/conda.sh"
$ conda activate $FPGA_FAM

# Bauen des Bitstreams
$ TARGET="basys3" make -f bitstream.mk -C .
```

Der Bitstream befindet sich dann unter `./build/basys3/calculator.bit`
