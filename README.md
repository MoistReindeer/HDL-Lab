# HDL-Files

A repo to document some F4PGA related projects

## F4PGA-Installation

The F4PGA installation guide currently supports the EOS-Quicklogic-S3 and the Xilinx Artix 7 boards.

The required files can be installed with the scripts:

``` 
# Installs the EOS-Quicklogic environment
$ ./install.sh -eos

# Installs the Artix 7 environment
$ ./install.sh -xc7
```

## Additional tools

```
# Install verilator for SystemVerilog simulator
$ sudo pacman -S verilator

# Install gtkwave to view simulation results
$ sudo pacman -S gtkwave
```

## Activate the environment

```
# For EOS-Quicklogic
$ export FPGA_FAM="eos-s3"

# For Artix 7
$ export FPGA_FAM="xc7"

$ export F4PGA_INSTALL_DIR=/opt/f4pga
$ source "$F4PGA_INSTALL_DIR/$FPGA_FAM/conda/etc/profile.d/conda.sh"
$ conda activate $FPGA_FAM
```

## Simulation

```
# First build and run the simulation with verilator
$ verilator --binary -j 0 -Wall --trace-fst -Mdir ./build/ <<*.sv files>>
$ ./build/V<<tb file>>

# Now view the results with gtkwave
$ gtkwave ./build/<<output name>>.fst
# The output name is set within the testbench
```
