current_dir := $(CURDIR)
TOP := calculator
SOURCES := $(current_dir)/calculator.sv \
	$(current_dir)/arithmetic.sv \
	$(current_dir)/bcd_mux.sv \
	$(current_dir)/calculator_input.sv \
	$(current_dir)/debounce.sv \
	$(current_dir)/input_sync.sv \
	$(current_dir)/seg_dec.sv \
	$(current_dir)/slider_increment.sv

# XDC File
XDC := $(current_dir)/basys3.xdc

include ${current_dir}/../../f4pga-examples/common/common.mk
