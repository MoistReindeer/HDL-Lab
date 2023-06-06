/* verilator lint_off UNUSEDSIGNAL */
module calculator_input (
    input logic clk,
    input logic reset,
    input logic button_clr_undeb,
    input logic button_add_undeb,
    input logic button_sub_undeb,
    input logic button_ent_undeb,
    input logic slider_1_undeb,
    input logic slider_2_undeb,
    input logic slider_3_undeb,
    input logic slider_4_undeb
);

    logic button_clr;
    logic button_ent;
    logic button_add;
    logic button_sub;
    logic slider_1;
    logic slider_2;
    logic slider_3;
    logic slider_4;

    // Syncronize and debounce buttons
    // Clear-Button
    logic button_clr_deb;
    debounce clr_deb (
        .clk(clk),
        .rst_ext(reset),
        .undeb(button_clr_undeb),
        .deb(button_clr_deb));
    
    input_sync clr_sync (
        .clk(clk),
        .rst(reset),
        .unsync(button_clr_deb),
        .synced(button_clr));
    
    // Enter-Button
    logic button_ent_deb;
    debounce ent_deb (
        .clk(clk),
        .rst_ext(reset),
        .undeb(button_ent_undeb),
        .deb(button_ent_deb));
    
    input_sync ent_sync (
        .clk(clk),
        .rst(reset),
        .unsync(button_ent_deb),
        .synced(button_ent));
    
    // Add-Button
    logic button_add_deb;
    debounce add_deb (
        .clk(clk),
        .rst_ext(reset),
        .undeb(button_add_undeb),
        .deb(button_add_deb));
    
    input_sync add_sync (
        .clk(clk),
        .rst(reset),
        .unsync(button_add_deb),
        .synced(button_add));
    

    // Subtract-Button
    logic button_sub_deb;
    debounce sub_deb (
        .clk(clk),
        .rst_ext(reset),
        .undeb(button_sub_undeb),
        .deb(button_sub_deb));
    
    input_sync sub_sync (
        .clk(clk),
        .rst(reset),
        .unsync(button_sub_deb),
        .synced(button_sub));
    
    // Debounce and sync sliders
    // Slider 1 - 1er
    logic slider_1_deb;
    debounce sld_1_deb (
        .clk(clk),
        .rst_ext(reset),
        .undeb(slider_1_undeb),
        .deb(slider_1_deb));
    
    input_sync sld_1_sync (
        .clk(clk),
        .rst(reset),
        .unsync(slider_1_deb),
        .synced(slider_1));
    
    // Slider 2 - 10er
    logic slider_2_deb;
    debounce sld_2_deb (
        .clk(clk),
        .rst_ext(reset),
        .undeb(slider_2_undeb),
        .deb(slider_2_deb));
    
    input_sync sld_2_sync (
        .clk(clk),
        .rst(reset),
        .unsync(slider_2_deb),
        .synced(slider_2));
    
    // Slider 3 - 100er
    logic slider_3_deb;
    debounce sld_3_deb (
        .clk(clk),
        .rst_ext(reset),
        .undeb(slider_3_undeb),
        .deb(slider_3_deb));
    
    input_sync sld_3_sync (
        .clk(clk),
        .rst(reset),
        .unsync(slider_3_deb),
        .synced(slider_3));
    
    // Slider 4 - 1000er
    logic slider_4_deb;
    debounce sld_4_deb (
        .clk(clk),
        .rst_ext(reset),
        .undeb(slider_4_undeb),
        .deb(slider_4_deb));
    
    input_sync sld_4_sync (
        .clk(clk),
        .rst(reset),
        .unsync(slider_4_deb),
        .synced(slider_4));

endmodule
