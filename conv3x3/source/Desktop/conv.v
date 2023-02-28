module  conv(
	 input clk, //pixel clk
	 input rst_n,
	 
	 input [15:0]data_in_r,  
	 input [15:0]data_in_g, 
	 input [15:0]data_in_b, 
  
	 input data_in_en,

	 input [3:0]coe0_0_r,
	 input [3:0]coe0_1_r,
	 input [3:0]coe0_2_r,
	 input [3:0]coe1_0_r,
	 input [3:0]coe1_1_r,
	 input [3:0]coe1_2_r,
	 input [3:0]coe2_0_r,
	 input [3:0]coe2_1_r,
	 input [3:0]coe2_2_r,

	 input [3:0]coe0_0_g,
	 input [3:0]coe0_1_g,
	 input [3:0]coe0_2_g,
	 input [3:0]coe1_0_g,
	 input [3:0]coe1_1_g,
	 input [3:0]coe1_2_g,
	 input [3:0]coe2_0_g,
	 input [3:0]coe2_1_g,
	 input [3:0]coe2_2_g,

	 input [3:0]coe0_0_b,
	 input [3:0]coe0_1_b,
	 input [3:0]coe0_2_b,
	 input [3:0]coe1_0_b,
	 input [3:0]coe1_1_b,
	 input [3:0]coe1_2_b,
	 input [3:0]coe2_0_b,
	 input [3:0]coe2_1_b,
	 input [3:0]coe2_2_b,
	 
	 output reg [15:0] data_out,
	 output reg data_out_en
);
//------------------------------------
// 三行像素缓存
//----------------------------------- 
wire [15:0] line0_r;
wire [15:0] line1_r;
wire [15:0] line2_r;

wire [15:0] line0_g;
wire [15:0] line1_g;
wire [15:0] line2_g;

wire [15:0] line0_b;
wire [15:0] line1_b;
wire [15:0] line2_b;
//-----------------------------------------
//3x3 像素矩阵中的像素点
//-----------------------------------------
reg [15:0] line0_data0_r;
reg [15:0] line0_data1_r;
reg [15:0] line0_data2_r;
reg [15:0] line1_data0_r;
reg [15:0] line1_data1_r;
reg [15:0] line1_data2_r;
reg [15:0] line2_data0_r;
reg [15:0] line2_data1_r;
reg [15:0] line2_data2_r;

reg [15:0] line0_data0_g;
reg [15:0] line0_data1_g;
reg [15:0] line0_data2_g;
reg [15:0] line1_data0_g;
reg [15:0] line1_data1_g;
reg [15:0] line1_data2_g;
reg [15:0] line2_data0_g;
reg [15:0] line2_data1_g;
reg [15:0] line2_data2_g;

reg [15:0] line0_data0_b;
reg [15:0] line0_data1_b;
reg [15:0] line0_data2_b;
reg [15:0] line1_data0_b;
reg [15:0] line1_data1_b;
reg [15:0] line1_data2_b;
reg [15:0] line2_data0_b;
reg [15:0] line2_data1_b;
reg [15:0] line2_data2_b;
//-----------------------------------------
//定义gx和gy的正负项中间变量
//-----------------------------------------
reg [17:0] sum;


wire   mat_flag; 
reg    mat_flag_1; 
reg    mat_flag_2; 
reg    mat_flag_3; 
reg    mat_flag_4; 
reg    mat_flag_5; 
reg    mat_flag_6;
reg    mat_flag_7; //这里假设开方用的SQRT IP核输出和输入的延迟是一个clk

always @(posedge clk)begin
        mat_flag_1          <=          mat_flag;      
        mat_flag_2          <=          mat_flag_1;      
        mat_flag_3          <=          mat_flag_2;      
        mat_flag_4          <=          mat_flag_3; 
        mat_flag_5          <=          mat_flag_4;      
        mat_flag_6          <=          mat_flag_5;      
        mat_flag_7          <=          mat_flag_6;      
end

//---------------------------------------------
// 获取3*3的图像矩阵
//---------------------------------------------
matrix_3x3 matrix_3x3_inst_r(
    .clk (clk),
    .rst_n(rst_n),
    .din (data_in_r),
    .valid_in(data_in_en),
    .dout(),
    .dout_r0(line0_r),
    .dout_r1(line1_r),
    .dout_r2(line2_r),
    .mat_flag(mat_flag)
);

matrix_3x3 matrix_3x3_inst_g(
    .clk (clk),
    .rst_n(rst_n),
    .din (data_in_g),
    .valid_in(data_in_en),
    .dout(),
    .dout_r0(line0_g),
    .dout_r1(line1_g),
    .dout_r2(line2_g),
    .mat_flag()
);

matrix_3x3 matrix_3x3_inst_b(
    .clk (clk),
    .rst_n(rst_n),
    .din (data_in_b),
    .valid_in(data_in_en),
    .dout(),
    .dout_r0(line0_b),
    .dout_r1(line1_b),
    .dout_r2(line2_b),
    .mat_flag()
);





//--------------------------------------------------
// Form an image matrix of three multiplied by three
//--------------------------------------------------
always @(posedge clk or negedge rst_n) begin
 if(!rst_n) begin
	 line0_data0_r <= 16'b0;
	 line0_data1_r <= 16'b0;
	 line0_data2_r <= 16'b0;
	 
	 line1_data0_r <= 16'b0;
	 line1_data1_r <= 16'b0;
	 line1_data2_r <= 16'b0;
	 
	 line2_data0_r <= 16'b0;
	 line2_data1_r <= 16'b0;
	 line2_data2_r <= 16'b0;

     line0_data0_g <= 16'b0;
	 line0_data1_g <= 16'b0;
	 line0_data2_g <= 16'b0;
	 
	 line1_data0_g <= 16'b0;
	 line1_data1_g <= 16'b0;
	 line1_data2_g <= 16'b0;
	 
	 line2_data0_g <= 16'b0;
	 line2_data1_g <= 16'b0;
	 line2_data2_g <= 16'b0;

     line0_data0_b <= 16'b0;
	 line0_data1_b <= 16'b0;
	 line0_data2_b <= 16'b0;
	 
	 line1_data0_b <= 16'b0;
	 line1_data1_b <= 16'b0;
	 line1_data2_b <= 16'b0;
	 
	 line2_data0_b <= 16'b0;
	 line2_data1_b <= 16'b0;
	 line2_data2_b <= 16'b0;

 end
 else if(data_in_en) begin //像素有效信号
	 line0_data0_r <= line0_r;
	 line0_data1_r <= line0_data0_r;
	 line0_data2_r <= line0_data1_r;
	 
	 line1_data0_r <= line1_r;
	 line1_data1_r <= line1_data0_r;
	 line1_data2_r <= line1_data1_r;
	 
	 line2_data0_r <= line2_r;
	 line2_data1_r <= line2_data0_r;
	 line2_data2_r <= line2_data1_r; 

	 line0_data0_g <= line0_g;
	 line0_data1_g <= line0_data0_g;
	 line0_data2_g <= line0_data1_g;
	 
	 line1_data0_g <= line1_g;
	 line1_data1_g <= line1_data0_g;
	 line1_data2_g <= line1_data1_g;
	 
	 line2_data0_g <= line2_g;
	 line2_data1_g <= line2_data0_g;
	 line2_data2_g <= line2_data1_g;

	 line0_data0_b <= line0_b;
	 line0_data1_b <= line0_data0_b;
	 line0_data2_b <= line0_data1_b;
	 
	 line1_data0_b <= line1_b;
	 line1_data1_b <= line1_data0_b;
	 line1_data2_b <= line1_data1_b;
	 
	 line2_data0_b <= line2_b;
	 line2_data1_b <= line2_data0_b;
	 line2_data2_b <= line2_data1_b;



 end
end

always @(posedge clk or negedge rst_n) begin
 if(!rst_n)
 	data_out <= 16'b0;
 else if(data_in_en)  
        data_out <=

    line0_data0_r*coe0_0_r+line0_data1_r*coe0_1_r+line0_data2_r*coe0_2_r+
	line1_data0_r*coe1_0_r+line1_data1_r*coe1_1_r+line1_data2_r*coe1_2_r+
	line2_data0_r*coe2_0_r+line2_data1_r*coe2_1_r+line2_data2_r*coe2_2_r
    

   +line0_data0_g*coe0_0_g+line0_data1_g*coe0_1_g+line0_data2_g*coe0_2_g+
	line1_data0_g*coe1_0_g+line1_data1_g*coe1_1_g+line1_data2_g*coe1_2_g+
	line2_data0_g*coe2_0_g+line2_data1_g*coe2_1_g+line2_data2_g*coe2_2_g

   +line0_data0_b*coe0_0_b+line0_data1_b*coe0_1_b+line0_data2_b*coe0_2_b+
	line1_data0_b*coe1_0_b+line1_data1_b*coe1_1_b+line1_data2_b*coe1_2_b+
	line2_data0_b*coe2_0_b+line2_data1_b*coe2_1_b+line2_data2_b*coe2_2_b;



 else ;
end

/*
always @(posedge clk or negedge rst_n) begin
 if(!rst_n)
 	data_out <= 16'b0;
 else if(data_in_en)
 	data_out <= sum;
 else ;
end
*/

always @(posedge clk or negedge rst_n)
    if(rst_n == 1'b0)
        data_out_en  <= 1'b0;
    else if(mat_flag_3 == 1'b1 && mat_flag_7 == 1'b1) 
        data_out_en  <= 1'b1;
    else
        data_out_en  <= 1'b0;

endmodule
