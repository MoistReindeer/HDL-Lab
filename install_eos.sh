#!/bin/bash

cd /tmp

# Setup Install Variables
export F4PGA_INSTALL_DIR="/opt/f4pga"
export FPGA_FAM=eos-s3
# Both fetched from here: https://f4pga-examples.readthedocs.io/en/latest/getting.html
export F4PGA_TIMESTAMP='20220920-124259'
export F4PGA_HASH='007d1c1'

# Get f4pga-example directory
git clone https://github.com/chipsalliance/f4pga-examples
cd ./f4pga-examples

# Get Conad Installer
wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -O conda_installer.sh

# Install Conda requirements
bash conda_installer.sh -u -b -p $F4PGA_INSTALL_DIR/$FPGA_FAM/conda
source "$F4PGA_INSTALL_DIR/$FPGA_FAM/conda/etc/profile.d/conda.sh"
conda env create -f $FPGA_FAM/environment.yml

mkdir -p $F4PGA_INSTALL_DIR/$FPGA_FAM
export F4PGA_PACKAGES='install-ql ql-eos-s3_wlcsp'
for PKG in $F4PGA_PACKAGES; do
    wget -qO- https://storage.googleapis.com/symbiflow-arch-defs/artifacts/prod/foss-fpga-tools/symbiflow-arch-defs/continuous/install/${F4PGA_TIMESTAMP}/symbiflow-arch-defs-${PKG}-${F4PGA_HASH}.tar.xz | tar -xJC $F4PGA_INSTALL_DIR/${FPGA_FAM}
done
echo "Installed EOS-S3 Environment"
