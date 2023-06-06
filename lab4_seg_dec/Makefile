
all: init tb

init:
	mkdir -p ./build/

tb: seg_dec_tb.sv seg_dec.sv
	iverilog -g2012 -o ./build/output seg_dec_tb.sv seg_dec.sv
	vvp ./build/output

waveform: init test
	gtkwave ./build/data.vcd &

clean:
	rm -rd build
