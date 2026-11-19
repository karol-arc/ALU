/*
 * Copyright (c) 2024 Your Name
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_example (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

  localparam MIN_VAL = -10;
  localparam MAX_VAL = 59;
  
  always @(posedge clk or posedge reset) begin
    if (reset) begin
      count <= MIN_VAL;
    end else if (enable) begin
      if (count < MAX_VAL) begin
        count <= count + 1;
      end else begin
        count <= MIN_VAL;
      end
    end 
endmodule
