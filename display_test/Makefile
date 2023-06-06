GTKW = $(shell pgrep gtkwave)

all: init ./build/top.fst

init:
	mkdir -p ./build/

./build/top.fst: bcd_mux.sv display.sv seg_dec.sv top.sv top_tb.sv
	verilator --binary -j 0 -Wall --trace-fst -Mdir ./build/ top_tb.sv top.sv bcd_mux.sv display.sv seg_dec.sv
	./build/Vtop_tb
ifeq ($(GTKW),)
	gtkwave ./build/top.fst &
endif

clean:
	rm -rd ./build/