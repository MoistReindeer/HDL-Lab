GTKW = $(shell pgrep gtkwave)

all: init ./build/calculator_input.fst

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

./build/input_sync.fst: input_sync_tb.sv input_sync.sv
	verilator --binary -j 0 -Wall --trace-fst -Mdir ./build/ input_sync_tb.sv input_sync.sv
	./build/Vinput_sync_tb
ifeq ($(GTKW),)
	gtkwave ./build/input_sync.fst &
endif

./build/slider_increment.fst: slider_increment_tb.sv slider_increment.sv
	verilator --binary -j 0 -Wall --trace-fst -Mdir ./build/ slider_increment_tb.sv slider_increment.sv
	./build/Vslider_increment_tb
ifeq ($(GTKW),)
	gtkwave ./build/slider_increment.fst &
endif

./build/calculator_input.fst: calculator_input_tb.sv calculator_input.sv debounce.sv input_sync.sv
	verilator --binary -j 0 -Wall --trace-fst -Mdir ./build/ calculator_input_tb.sv calculator_input.sv debounce.sv input_sync.sv
	./build/Vcalculator_input_tb
ifeq ($(GTKW),)
	gtkwave ./build/calculator_input.fst &
endif

clean:
	rm -rd build
