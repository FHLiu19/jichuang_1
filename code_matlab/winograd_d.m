function [R1,R2,R3,R4]=winograd_d(k1,k2,k3,k4,k5,k6,k7,k8,k9,k10,k11,k12,k13,k14,k15,k16,...
    w1,w2,w3,w4,w5,w6,w7,w8,w9)


%[R1,R2,R3,R4]=winograd_d(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,1,2,3,4,5,6,7,8,9)

% R=zeros(1,4);
%R=winograd_d([1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16],[1,2,3,4,5,6,7,8,9])

% d=zeros(4,4);
% g=zeros(3,3);
% g_=zeros(3,4);
% m=zeros(2,4);
% 
% R=int16(R);
% d=int16(d);
% g=int16(g);
% g_=int16(g_);
% m=int16(m);
% 
% d(:,1)=Ki(1:4);
% d(:,2)=Ki(5:8);
% d(:,3)=Ki(9:12);
% d(:,4)=Ki(13:16);
% 
% g(:,1)=Wi(1:3);
% g(:,2)=Wi(4:6);
% g(:,3)=Wi(7:9);
% 
% g_(:,1)=g(:,1);
% g_(:,2)=(g(:,1)+g(:,2)+g(:,3))/2;
% g_(:,3)=(g(:,1)-g(:,2)+g(:,3))/2;
% g_(:,4)=g(:,3);
% 
%     m(:,1)=winograd_s((d(:,1)-d(:,3)),g_(:,1));
%     m(:,2)=winograd_s((d(:,2)+d(:,3)),g_(:,2));
%     m(:,3)=winograd_s((d(:,3)-d(:,2)),g_(:,3));
%     m(:,4)=winograd_s((d(:,2)-d(:,4)),g_(:,4));
%     R(1:2)=m(:,1)+m(:,2)+m(:,3);
%     R(3:4)=m(:,2)-m(:,3)-m(:,4);

d1_1=k1;
d2_1=k2;
d3_1=k3;
d4_1=k4;

d1_2=k5;
d2_2=k6;
d3_2=k7;
d4_2=k8;

d1_3=k9;
d2_3=k10;
d3_3=k11;
d4_3=k12;

d1_4=k13;
d2_4=k14;
d3_4=k15;
d4_4=k16;

g1_1=w1;
g2_1=w2;
g3_1=w3;

g1_2=w4;
g2_2=w5;
g3_2=w6;

g1_3=w7;
g2_3=w8;
g3_3=w9;




g_1_1=g1_1;
g_2_1=g2_1;
g_3_1=g3_1;

g_1_2=(g1_1+g1_2+g1_3)/2;
g_2_2=(g2_1+g2_2+g2_3)/2;
g_3_2=(g3_1+g3_2+g3_3)/2;

g_1_3=(g1_1-g1_2+g1_3)/2;
g_2_3=(g2_1-g2_2+g2_3)/2;
g_3_3=(g3_1-g3_2+g3_3)/2;

g_1_4=g1_3;
g_2_4=g2_3;
g_3_4=g3_3;


    [m1_1,m2_1]=winograd_s(d1_1-d1_3,d2_1-d2_3,d3_1-d3_3,d4_1-d4_3,g_1_1,g_2_1,g_3_1);
    

    [m1_2,m2_2]=winograd_s(d1_2+d1_3,d2_2+d2_3,d3_2+d3_3,d4_2+d4_3,g_1_2,g_2_2,g_3_2);
    

    [m1_3,m2_3]=winograd_s(d1_3-d1_2,d2_3-d2_2,d3_3-d3_2,d4_3-d4_2,g_1_3,g_2_3,g_3_3);
    

    [m1_4,m2_4]=winograd_s(d1_2-d1_4,d2_2-d2_4,d3_2-d3_4,d2_1-d4_4,g_1_4,g_2_4,g_3_4);
    
    

    R1=m1_1+m1_2+m1_3;
    R2=m2_1+m2_2+m2_3;

    R3=m1_2-m1_3-m1_4;
    R4=m2_1-m2_3-m2_4;
    
    
    
    