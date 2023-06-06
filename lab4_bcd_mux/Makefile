GTKW = $(shell pgrep gtkwave)

all: init bcd_mux_tb

init:
	mkdir -p ./build/

seg_dec_tb: seg_dec_tb.sv seg_dec.sv
	verilator --binary -j 0 -Wall --trace -Mdir ./build/ seg_dec_tb.sv seg_dec.sv
	./obj_dir/Vseg_dec_tb
ifeq ($(GTKW),)
	gtkwave ./build/seg_dec.vcd &
endif

bcd_mux_tb: bcd_mux_tb.sv bcd_mux.sv
	verilator --binary -j 0 -Wall --trace -Mdir ./build/ bcd_mux_tb.sv bcd_mux.sv
	./obj_dir/Vbcd_mux_tb
ifeq ($(GTKW),)
	gtkwave ./build/seg_dec.vcd &
endif

clean:
	rm -rd build
	rm -rd obj_dir
