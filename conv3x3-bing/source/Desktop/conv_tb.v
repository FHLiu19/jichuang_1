`timescale 1ns/1ps
`define CLK_PERIOD 20//50MHZ

/*
module  conv(
	 input clk, //pixel clk
	 input rst_n,
	 
	 input [15:0]data_in_r,  
	 input [15:0]data_in_g, 
	 input [15:0]data_in_b, 
  
	 input data_in_en,

	 input coe0_0_r,
	 input coe0_1_r,
	 input coe0_2_r,
	 input coe1_0_r,
	 input coe1_1_r,
	 input coe1_2_r,
	 input coe2_0_r,
	 input coe2_1_r,
	 input coe2_2_r,

	 input coe0_0_g,
	 input coe0_1_g,
	 input coe0_2_g,
	 input coe1_0_g,
	 input coe1_1_g,
	 input coe1_2_g,
	 input coe2_0_g,
	 input coe2_1_g,
	 input coe2_2_g,

	 input coe0_0_b,
	 input coe0_1_b,
	 input coe0_2_b,
	 input coe1_0_b,
	 input coe1_1_b,
	 input coe1_2_b,
	 input coe2_0_b,
	 input coe2_1_b,
	 input coe2_2_b,
	 
	 output reg [15:0] data_out,
	 output reg data_out_en
);


module matrix_3x3 (
    clk,
    rst_n,
    valid_in,//输入数据有效信号
    din,//输入的图像数据，将一帧的数据从左到右，然后从上到下依次输入
    
    dout_r0,//第一行的输出数据
    dout_r1,//第二行的输出数据
    dout_r2,//第三行的输出数据
    dout,//最后一行的输出数据
    mat_flag//当第四行数据到来，前三行数据才开始同时输出，此时该信号拉高
);
*/

module conv_tb ();
reg clk;

reg [15:0] din;
reg [15:0] data_in_r;
reg [15:0] data_in_g;
reg [15:0] data_in_b;

reg rst_n;
reg data_in_en;

wire [15:0] data_out;
wire [15:0] data_out_1;
wire [15:0] data_out_2;
wire data_out_en;


reg [3:0]coe0_0_r;
reg [3:0]coe0_1_r;
reg [3:0]coe0_2_r;
reg [3:0]coe1_0_r;
reg [3:0]coe1_1_r;
reg [3:0]coe1_2_r;
reg [3:0]coe2_0_r;
reg [3:0]coe2_1_r;
reg [3:0]coe2_2_r;

reg [3:0]coe0_0_g;
reg [3:0]coe0_1_g;
reg [3:0]coe0_2_g;
reg [3:0]coe1_0_g;
reg [3:0]coe1_1_g;
reg [3:0]coe1_2_g;
reg [3:0]coe2_0_g;
reg [3:0]coe2_1_g;
reg [3:0]coe2_2_g;

reg [3:0]coe0_0_b;
reg [3:0]coe0_1_b;
reg [3:0]coe0_2_b;
reg [3:0]coe1_0_b;
reg [3:0]coe1_1_b;
reg [3:0]coe1_2_b;
reg [3:0]coe2_0_b;
reg [3:0]coe2_1_b;
reg [3:0]coe2_2_b;




conv conv_inst (
    .clk(clk),                  // INPUT
    .rst_n(rst_n),              // INPUT
    .data_in_en(data_in_en),    // INPUT
    .coe0_0_r(coe0_0_r),        // INPUT
    .coe0_1_r(coe0_1_r),        // INPUT
    .coe0_2_r(coe0_2_r),        // INPUT
    .coe1_0_r(coe1_0_r),        // INPUT
    .coe1_1_r(coe1_1_r),        // INPUT
    .coe1_2_r(coe1_2_r),        // INPUT
    .coe2_0_r(coe2_0_r),        // INPUT
    .coe2_1_r(coe2_1_r),        // INPUT
    .coe2_2_r(coe2_2_r),        // INPUT
    .coe0_0_g(coe0_0_g),        // INPUT
    .coe0_1_g(coe0_1_g),        // INPUT
    .coe0_2_g(coe0_2_g),        // INPUT
    .coe1_0_g(coe1_0_g),        // INPUT
    .coe1_1_g(coe1_1_g),        // INPUT
    .coe1_2_g(coe1_2_g),        // INPUT
    .coe2_0_g(coe2_0_g),        // INPUT
    .coe2_1_g(coe2_1_g),        // INPUT
    .coe2_2_g(coe2_2_g),        // INPUT
    .coe0_0_b(coe0_0_b),        // INPUT
    .coe0_1_b(coe0_1_b),        // INPUT
    .coe0_2_b(coe0_2_b),        // INPUT
    .coe1_0_b(coe1_0_b),        // INPUT
    .coe1_1_b(coe1_1_b),        // INPUT
    .coe1_2_b(coe1_2_b),        // INPUT
    .coe2_0_b(coe2_0_b),        // INPUT
    .coe2_1_b(coe2_1_b),        // INPUT
    .coe2_2_b(coe2_2_b),        // INPUT
    .data_out_en(data_out_en),  // OUTPUT
    .data_in_r(data_in_r),      // INPUT[15:0] 
    .data_in_g(data_in_g),      // INPUT[15:0] 
    .data_in_b(data_in_b),      // INPUT[15:0] 
    .data_out(data_out)        // OUTPUT[15:0]
);


initial begin


coe0_0_r=1;
coe0_1_r=1;
coe0_2_r=1;
coe1_0_r=1;
coe1_1_r=1;
coe1_2_r=1;
coe2_0_r=1;
coe2_1_r=1;
coe2_2_r=1;

coe0_0_g=1;
coe0_1_g=1;
coe0_2_g=1;
coe1_0_g=1;
coe1_1_g=8;
coe1_2_g=1;
coe2_0_g=1;
coe2_1_g=1;
coe2_2_g=1;

coe0_0_b=1;
coe0_1_b=2;
coe0_2_b=1;
coe1_0_b=0;
coe1_1_b=0;
coe1_2_b=0;
coe2_0_b=-1;
coe2_1_b=-2;
coe2_2_b=-1;

    clk = 0;
    rst_n = 0;
    data_in_en = 0;
    #(`CLK_PERIOD * 10);
    rst_n=1;
    #(`CLK_PERIOD*10);
    data_in_en = 1;
    #(`CLK_PERIOD*480*5);
    data_in_en = 0;
    #(`CLK_PERIOD*20);
    $stop;
end

always #(`CLK_PERIOD/2) clk = ~clk;

/*
    这里din会在0-479之后，返回0，再次从0-479；
    所以，模拟的每一行数据都是从0-479，因此在仿真时三行数据对齐时它们的数据才会是一样的。

    如果输入的din是真实的图像数据，那么由于一帧图像数据每一行是不一样的，所以对齐后三行数据也不相同。
*/
always @ (posedge clk or negedge rst_n)begin
    if(!rst_n) begin
        din <= 0;
        data_in_r<=0;
        data_in_g<=0;
        data_in_b<=0;
    end
    else if(din == 479) begin
        din <= 0;
        data_in_r<=0;
        data_in_g<=0;
        data_in_b<=0;
    end
    else if (data_in_en == 1'b1) begin
        din <= din + 1'b1;
        data_in_r<=data_in_r+1'b1;
        data_in_g<=data_in_g+1'b1;
        data_in_b<=data_in_b+1'b1;
    end
end

assign data_out_1=data_out;
assign data_out_2=data_out;

endmodule