module calculator_input #(
    parameter DB_OVERFLOW = 999999
)(
    input logic clk,
    input logic reset,
    input logic button_clr_undeb,
    input logic button_ent_undeb,
    output logic button_clr,
    output logic button_ent
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
endmodule
