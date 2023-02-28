// Created by IP Generator (Version 2020.3-Lite build 71107)
// Instantiation Template
//
// Insert the following codes into your Verilog file.
//   * Change the_instance_name to your own instance name.
//   * Change the signal names in the port associations


fifo0 the_instance_name (
  .wr_data(wr_data),              // input [15:0]
  .wr_en(wr_en),                  // input
  .full(full),                    // output
  .almost_full(almost_full),      // output
  .rd_data(rd_data),              // output [15:0]
  .rd_en(rd_en),                  // input
  .empty(empty),                  // output
  .almost_empty(almost_empty),    // output
  .clk(clk),                      // input
  .rst(rst)                       // input
);
