# HDL-QuickLogic Tests

A repo to store HDL tests for the Sparkfun QuickLogic board

## Installation

The F4PGA installation guide currently supports the EOS-Quicklogic-S3 and the Xilinx Artix 7 boards.

The required files can be installed with the scripts:

``` 
# Installs the EOS-Quicklogic environment
$ ./install_eos.sh

# Installs the Artix 7 environment
$ ./install_xc7.sh
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
