# Clock pin
set_property PACKAGE_PIN W5 [get_ports {clk}]
set_property IOSTANDARD LVCMOS33 [get_ports {clk}]

create_clock -period 10.000 -name clk100 -waveform {0.000 5.000} [get_ports clk]
set_property CONFIG_VOLTAGE 3.3 [current_design]
set_property CFGBVS VCCO [current_design]

# Display-Select
set_property PACKAGE_PIN W4 [get_ports {digit_select[3]}]
set_property PACKAGE_PIN V4 [get_ports {digit_select[2]}]
set_property PACKAGE_PIN U4 [get_ports {digit_select[1]}]
set_property PACKAGE_PIN U2 [get_ports {digit_select[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {digit_select[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {digit_select[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {digit_select[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {digit_select[0]}]

# LEDs
set_property PACKAGE_PIN W7 [get_ports {led_select[6]}]
set_property PACKAGE_PIN W6 [get_ports {led_select[5]}]
set_property PACKAGE_PIN U8 [get_ports {led_select[4]}]
set_property PACKAGE_PIN V8 [get_ports {led_select[3]}]
set_property PACKAGE_PIN U5 [get_ports {led_select[2]}]
set_property PACKAGE_PIN V5 [get_ports {led_select[1]}]
set_property PACKAGE_PIN U7 [get_ports {led_select[0]}]

set_property IOSTANDARD LVCMOS33 [get_ports {led_select[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led_select[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led_select[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led_select[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led_select[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led_select[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led_select[6]}]

# Buttons
set_property PACKAGE_PIN W19 [get_ports button_ent_undeb]
set_property PACKAGE_PIN T18 [get_ports button_clr_undeb]
set_property PACKAGE_PIN T17 [get_ports reset]

set_property IOSTANDARD LVCMOS33 [get_ports button_ent_undeb]
set_property IOSTANDARD LVCMOS33 [get_ports button_clr_undeb]
set_property IOSTANDARD LVCMOS33 [get_ports reset]

# Sliders
set_property PACKAGE_PIN V17 [get_ports sld_1]
set_property PACKAGE_PIN V16 [get_ports sld_2]
set_property PACKAGE_PIN W16 [get_ports sld_3]
set_property PACKAGE_PIN W17 [get_ports sld_4]
set_property PACKAGE_PIN R2 [get_ports sld_arith]

set_property IOSTANDARD LVCMOS33 [get_ports sld_1]
set_property IOSTANDARD LVCMOS33 [get_ports sld_2]
set_property IOSTANDARD LVCMOS33 [get_ports sld_3]
set_property IOSTANDARD LVCMOS33 [get_ports sld_4]
set_property IOSTANDARD LVCMOS33 [get_ports sld_arith]
