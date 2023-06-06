GTKW = $(shell pgrep gtkwave)

all: init ./build/debounce.fst

init:
	mkdir -p ./build/

seg_dec_tb: seg_dec_tb.sv seg_dec.sv
	verilator --binary -j 0 -Wall --trace-fst -Mdir ./build/ seg_dec_tb.sv seg_dec.sv
	./build/Vseg_dec_tb
ifeq ($(GTKW),)
	gtkwave ./build/seg_dec.fst &
endif

bcd_mux_tb: bcd_mux_tb.sv bcd_mux.sv
	verilator --binary -j 0 -Wall --trace-fst -Mdir ./build/ bcd_mux_tb.sv bcd_mux.sv
	./build/Vbcd_mux_tb
ifeq ($(GTKW),)
	gtkwave ./build/bcd_mux.fst &
endif

./build/arithmetic.fst: arithmetic_tb.sv arithmetic.sv
	verilator --binary -j 0 -Wall --trace-fst -Mdir ./build/ arithmetic_tb.sv arithmetic.sv
	./build/Varithmetic_tb
ifeq ($(GTKW),)
	gtkwave ./build/arithmetic.fst &
endif

./build/debounce.fst: debounce_tb.sv debounce.sv
	verilator --binary -j 0 -Wall --trace-fst -Mdir ./build/ debounce_tb.sv debounce.sv
	./build/Vdebounce_tb
ifeq ($(GTKW),)
	gtkwave ./build/debounce.fst &
endif

clean:
	rm -rd build
