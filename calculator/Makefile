GTKW = $(shell pgrep gtkwave)

all: init ./build/calculator.fst

init:
	mkdir -p ./build/

./build/seg_dec.fst: ./testbench/seg_dec_tb.sv seg_dec.sv
	verilator --binary -j 0 -Wall --trace-fst -Mdir ./build/ ./testbench/seg_dec_tb.sv seg_dec.sv
	./build/Vseg_dec_tb
ifeq ($(GTKW),)
	gtkwave ./build/seg_dec.fst &
endif

./build/bcd_mux.fst: ./testbench/bcd_mux_tb.sv bcd_mux.sv
	verilator --binary -j 0 -Wall --trace-fst -Mdir ./build/ ./testbench/bcd_mux_tb.sv bcd_mux.sv split_number.sv
	./build/Vbcd_mux_tb
ifeq ($(GTKW),)
	gtkwave ./build/bcd_mux.fst &
endif

./build/arithmetic.fst: ./testbench/arithmetic_tb.sv arithmetic.sv
	verilator --binary -j 0 -Wall --trace-fst -Mdir ./build/ ./testbench/arithmetic_tb.sv arithmetic.sv
	./build/Varithmetic_tb
ifeq ($(GTKW),)
	gtkwave ./build/arithmetic.fst &
endif

./build/debounce.fst: ./testbench/debounce_tb.sv debounce.sv
	verilator --binary -j 0 -Wall --trace-fst -Mdir ./build/ ./testbench/debounce_tb.sv debounce.sv
	./build/Vdebounce_tb
ifeq ($(GTKW),)
	gtkwave ./build/debounce.fst &
endif

./build/input_sync.fst: ./testbench/input_sync_tb.sv input_sync.sv
	verilator --binary -j 0 -Wall --trace-fst -Mdir ./build/ ./testbench/input_sync_tb.sv input_sync.sv
	./build/Vinput_sync_tb
ifeq ($(GTKW),)
	gtkwave ./build/input_sync.fst &
endif

./build/slider_increment.fst: ./testbench/slider_increment_tb.sv slider_increment.sv
	verilator --binary -j 0 -Wall --trace-fst -Mdir ./build/ ./testbench/slider_increment_tb.sv slider_increment.sv
	./build/Vslider_increment_tb
ifeq ($(GTKW),)
	gtkwave ./build/slider_increment.fst &
endif

./build/display.fst: ./testbench/display_tb.sv display.sv bcd_mux.sv seg_dec.sv
	verilator --binary -j 0 -Wall --trace-fst -Mdir ./build/ ./testbench/display_tb.sv display.sv bcd_mux.sv seg_dec.sv
	./build/Vdisplay_tb
ifeq ($(GTKW),)
	gtkwave ./build/display.fst &
endif

./build/calculator_input.fst: ./testbench/calculator_input_tb.sv calculator_input.sv debounce.sv input_sync.sv
	verilator --binary -j 0 -Wall --trace-fst -Mdir ./build/ ./testbench/calculator_input_tb.sv calculator_input.sv debounce.sv input_sync.sv
	./build/Vcalculator_input_tb
ifeq ($(GTKW),)
	gtkwave ./build/calculator_input.fst &
endif

./build/calculator.fst: calculator_tb.sv calculator.sv slider_increment.sv input_sync.sv debounce.sv arithmetic.sv bcd_mux.sv seg_dec.sv
	verilator --binary -j 0 -Wall --trace-fst -Mdir ./build/ calculator_tb.sv calculator.sv slider_increment.sv input_sync.sv debounce.sv arithmetic.sv bcd_mux.sv seg_dec.sv
	./build/Vcalculator_tb
ifeq ($(GTKW),)
	gtkwave ./build/calculator.fst &
endif

clean:
	rm -rd build
