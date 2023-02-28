module  conv(
	 input clk, //pixel clk
	 input rst_n,
	 
	 input [15:0]data_in, //16 bit 灰度 pixel 
	 input data_in_en,

	 input coe0_0,
	 input coe0_1,
	 input coe0_2,
	 input coe1_0,
	 input coe1_1,
	 input coe1_2,
	 input coe2_0,
	 input coe2_1,
	 input coe2_2,
	 
	 output reg [15:0] data_out,
	 output reg data_out_en
);
//------------------------------------
// 三行像素缓存
//----------------------------------- 
wire [15:0] line0;
wire [15:0] line1;
wire [15:0] line2;
//-----------------------------------------
//3x3 像素矩阵中的像素点
//-----------------------------------------
reg [15:0] line0_data0;
reg [15:0] line0_data1;
reg [15:0] line0_data2;
reg [15:0] line1_data0;
reg [15:0] line1_data1;
reg [15:0] line1_data2;
reg [15:0] line2_data0;
reg [15:0] line2_data1;
reg [15:0] line2_data2;
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
matrix_3x3 matrix_3x3_inst(
    .clk (clk),
    .rst_n(rst_n),
    .din (data_in),
    .valid_in(data_in_en),
    .dout(),
    .dout_r0(line0),
    .dout_r1(line1),
    .dout_r2(line2),
    .mat_flag(mat_flag)
);

//--------------------------------------------------
// Form an image matrix of three multiplied by three
//--------------------------------------------------
always @(posedge clk or negedge rst_n) begin
 if(!rst_n) begin
	 line0_data0 <= 16'b0;
	 line0_data1 <= 16'b0;
	 line0_data2 <= 16'b0;
	 
	 line1_data0 <= 16'b0;
	 line1_data1 <= 16'b0;
	 line1_data2 <= 16'b0;
	 
	 line2_data0 <= 16'b0;
	 line2_data1 <= 16'b0;
	 line2_data2 <= 16'b0;

 end
 else if(data_in_en) begin //像素有效信号
	 line0_data0 <= line0;
	 line0_data1 <= line0_data0;
	 line0_data2 <= line0_data1;
	 
	 line1_data0 <= line1;
	 line1_data1 <= line1_data0;
	 line1_data2 <= line1_data1;
	 
	 line2_data0 <= line2;
	 line2_data1 <= line2_data0;
	 line2_data2 <= line2_data1; 
 end
end

always @(posedge clk or negedge rst_n) begin
 if(!rst_n)
 	sum <= 18'b0;
 else if(data_in_en)
	sum   <= line0_data0*coe0_0+line0_data1*coe0_1+line0_data3*coe0_2+
	line1_data0*coe1_0+line1_data1*coe1_1+line1_data3*coe1_2+
	line2_data0*coe2_0+line2_data1*coe2_1+line2_data3*coe2_2;
 else ;
end

assign data_out <= sum;

always @(posedge clk or negedge rst_n)
    if(rst_n == 1'b0)
        data_out_en  <= 1'b0;
    else if(mat_flag_3 == 1'b1 && mat_flag_7 == 1'b1) 
        data_out_en  <= 1'b1;
    else
        data_out_en  <= 1'b0;

endmodule
