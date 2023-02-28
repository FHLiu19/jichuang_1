function [r1,r2]=winograd_s(d1,d2,d3,d4,g1,g2,g3)

% r=winograd_s(1,2,3,4,1,2,3)

% g_=zeros(1,4);
% m=zeros(1,4);
% r=zeros(1,2);
% 
% r=int16(r);
% m=int16(m);
% g_=int16(g_);
% 
% g_(1)=g(1);
% g_(2)=(g(1)+g(2)+g(3))/2;
% g_(3)=(g(1)-g(2)+g(3))/2;
% g_(4)=g(3);
% 
% 
%     m(1)=(d(1)-d(3))*g_(1);
%     m(2)=(d(2)+d(3))*g_(2);
%     m(3)=(d(3)-d(2))*g_(3);
%     m(4)=(d(2)-d(4))*g_(4);
%     r(1)=m(1)+m(2)+m(3);
%     r(2)=m(2)-m(3)-m(4);



g_1=g1;
g_2=(g1+g2+g3)/2;
g_3=(g1-g2+g3)/2;
g_4=g3;


    m1=(d1-d3)*g_1;
    m2=(d2+d3)*g_2;
    m3=(d3-d2)*g_3;
    m4=(d2-d4)*g_4;
    r1=m1+m2+m3;
    r2=m2-m3-m4;