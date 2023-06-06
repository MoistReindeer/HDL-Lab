module calculator_input #(
    parameter DB_OVERFLOW = 100000000
)(
    input logic clk,
    input logic reset,
    input logic button_clr_undeb,
    input logic button_add_undeb,
    input logic button_sub_undeb,
    input logic button_ent_undeb,
    output logic button_clr,
    output logic button_ent,
    output logic button_add,
    output logic button_sub,
    input logic slider_1_undeb,
    input logic slider_2_undeb,
    input logic slider_3_undeb,
    input logic slider_4_undeb,
    output logic slider_1,
    output logic slider_2,
    output logic slider_3,
    output logic slider_4
);

    // Syncronize and debounce buttons
    // Clear-Button
    logic button_clr_deb;
    debounce #(.DB_OVERFLOW(DB_OVERFLOW)) clr_deb (
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
    debounce #(.DB_OVERFLOW(DB_OVERFLOW)) ent_deb (
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
    debounce #(.DB_OVERFLOW(DB_OVERFLOW)) add_deb (
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
    debounce #(.DB_OVERFLOW(DB_OVERFLOW)) sub_deb (
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
    debounce #(.DB_OVERFLOW(DB_OVERFLOW)) sld_1_deb (
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
    debounce #(.DB_OVERFLOW(DB_OVERFLOW)) sld_2_deb (
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
    debounce #(.DB_OVERFLOW(DB_OVERFLOW)) sld_3_deb (
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
    debounce #(.DB_OVERFLOW(DB_OVERFLOW)) sld_4_deb (
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
