clear;
clc;
close all
Ki=[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16];
Wi=[1,2,3,4,5,6,7,8,9];
Ki=int16(Ki);
Wi=int16(Wi);
R=winograd_d(Ki,Wi);