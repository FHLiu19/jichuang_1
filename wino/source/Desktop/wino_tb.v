`timescale 1ns/1ps

module wino_tb ();


reg   signed [13:0] k1;  // sfix14_En5
reg   signed [13:0] k2;  // sfix14_En5
reg   signed [13:0] k3;  // sfix14_En5
reg   signed [13:0] k4;  // sfix14_En5
reg   signed [13:0] k5;  // sfix14_En5
reg   signed [13:0] k6;  // sfix14_En5
reg   signed [13:0] k7;  // sfix14_En5
reg   signed [13:0] k8;  // sfix14_En5
reg   signed [13:0] k9;  // sfix14_En5
reg   signed [13:0] k10;  // sfix14_En5
reg   signed [13:0] k11;  // sfix14_En5
reg   signed [13:0] k12;  // sfix14_En5
reg   signed [13:0] k13;  // sfix14_En5
reg   signed [13:0] k14;  // sfix14_En5
reg   signed [13:0] k15;  // sfix14_En5
reg   signed [13:0] k16;  // sfix14_En5
reg   signed [13:0] w1;  // sfix14_En5
reg   signed [13:0] w2;  // sfix14_En5
reg   signed [13:0] w3;  // sfix14_En5
reg   signed [13:0] w4;  // sfix14_En5
reg   signed [13:0] w5;  // sfix14_En5
reg   signed [13:0] w6;  // sfix14_En5
reg   signed [13:0] w7;  // sfix14_En5
reg   signed [13:0] w8;  // sfix14_En5
reg   signed [13:0] w9;  // sfix14_En5
reg   signed [13:0] R1;  // sfix14_E3
reg   signed [13:0] R2;  // sfix14_E3
reg   signed [13:0] R3;
reg   signed [13:0] R4;  // sfix14_E3


/*
winograd_d_fixpt inst(
    .k1(k1),    // INPUT[13:0] 
    .k2(k2),    // INPUT[13:0] 
    .k3(k3),    // INPUT[13:0] 
    .k4(k4),    // INPUT[13:0] 
    .k5(k5),    // INPUT[13:0] 
    .k6(k6),    // INPUT[13:0] 
    .k7(k7),    // INPUT[13:0] 
    .k8(k8),    // INPUT[13:0] 
    .k9(k9),    // INPUT[13:0] 
    .k10(k10),  // INPUT[13:0] 
    .k11(k11),  // INPUT[13:0] 
    .k12(k12),  // INPUT[13:0] 
    .k13(k13),  // INPUT[13:0] 
    .k14(k14),  // INPUT[13:0] 
    .k15(k15),  // INPUT[13:0] 
    .k16(k16),  // INPUT[13:0] 
    .w1(w1),    // INPUT[13:0] 
    .w2(w2),    // INPUT[13:0] 
    .w3(w3),    // INPUT[13:0] 
    .w4(w4),    // INPUT[13:0] 
    .w5(w5),    // INPUT[13:0] 
    .w6(w6),    // INPUT[13:0] 
    .w7(w7),    // INPUT[13:0] 
    .w8(w8),    // INPUT[13:0] 
    .w9(w9),    // INPUT[13:0] 
    .R1(R1),    // OUTPUT[13:0] 
    .R2(R2),    // OUTPUT[13:0] 
    .R3(R3),    // OUTPUT[13:0] 
    .R4(R4)     // OUTPUT[13:0]
);
*/


initial begin

k1=1;
k2=2;
k3=3;
k4=4;
k5=5;
k6=6;
k7=7;
k8=8;
k9=9;
k10=10;
k11=11;
k12=12;
k13=13;
k14=14;
k15=15;
k16=16;

w1=1;
w2=2;
w3=3;
w4=4;
w5=5;
w6=6;
w7=7;
w8=8;
w9=9;

R1=348;
R2=393;
R3=528;
R4=168;



end

endmodule