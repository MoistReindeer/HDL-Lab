
all: init test

init:
	mkdir -p ./build/

test: mycounter_tb.sv mycounter.sv
	iverilog -g2012 -o ./build/output mycounter_tb.sv mycounter.sv
	vvp ./build/output

waveform: init test
	gtkwave ./build/counter.vcd &
clean:
	rm -rd build