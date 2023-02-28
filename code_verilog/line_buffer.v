`timescale 1ns/1ps

module line_buffer (
        rst_n,
        clk,
        din,
        dout,
        valid_in,
        valid_out
    );

parameter WIDTH = 10;//数据位宽
parameter IMG_WIDTH = 480;//图像宽度

input  rst_n;
input  clk;
input  [WIDTH-1:0] din;
output [WIDTH-1:0] dout;
input  valid_in;//输入数据有效，写使能
output valid_out;//输出给下一级的valid_in，也即上一级开始读的同时下一级就可以开始写入

wire   rd_en;//读使能
reg    [8:0] cnt;//这里的宽度注意要根据IMG_WIDTH的值来设置，需要满足cnt的范围≥图像宽度

always @(posedge clk or negedge rst_n) begin
    if(!rst_n)
        cnt <= {9{1'b0}};
    else if(valid_in)
        if(cnt == IMG_WIDTH)
            cnt <= IMG_WIDTH;
        else
            cnt <= cnt +1'b1;
    else
        cnt <= cnt;
end
//一行数据写完之后，该级fifo就可以开始读出，下一级也可以开始写入了
assign rd_en = ((cnt == IMG_WIDTH) && (valid_in)) ? 1'b1:1'b0;
assign valid_out = rd_en;

line_fifo u_line_fifo(
    .clk (clk),
    .rst (!rst_n),
    .din (din),
    .wr_en (valid_in),
    .rd_en (rd_en),
    .dout(dout),

    .empty(),
    .full(),
    .data_count(),    
    .wr_rst_busy(),  
    .rd_rst_busy()
);

/*
  .clk(clk),                  // input wire clk
  .rst(rst),                  // input wire rst
  .din(din),                  // input wire [9 : 0] din
  .wr_en(wr_en),              // input wire wr_en
  .rd_en(rd_en),              // input wire rd_en
  .dout(dout),                // output wire [9 : 0] dout
  .full(full),                // output wire full
  .empty(empty),              // output wire empty
  .data_count(data_count),    // output wire [8 : 0] data_count
  .wr_rst_busy(wr_rst_busy),  // output wire wr_rst_busy
  .rd_rst_busy(rd_rst_busy)  // output wire rd_rst_busy
*/
endmodule

