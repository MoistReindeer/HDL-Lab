
all: init tb

init:
	mkdir -p ./build/

seg_dec_tb.sv: seg_dec_tb.sv seg_dec.sv
	iverilog -g2012 -o ./build/seg_dec.out seg_dec_tb.sv seg_dec.sv
	vvp ./build/seg_dec.out

bcd_mux_tb.sv: bcd_mux_tb.sv bcd_mux.sv
	iverilog -g2012 -o ./build/bcd_mux.out seg_dec_tb.sv seg_dec.sv
	vvp ./build/bcd_mux.out

waveform: init bcd_mux_tb.sv
	gtkwave ./build/data.vcd &

clean:
	rm -rd build
