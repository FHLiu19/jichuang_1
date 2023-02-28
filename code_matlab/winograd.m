clear;
clc;
close all


g=[7 8 9];
N=2*1e7;

d=round(100*rand(1,4));

for i=1:N
    r0=(d(1)*g(1))+(d(2)*g(2))+(d(3)*g(3));
    r1=(d(2)*g(1))+(d(3)*g(1))+(d(4)*g(1));
end

g_(1)=g(1);
g_(2)=(g(1)+g(2)+g(3))/2;
g_(3)=(g(1)-g(2)+g(3))/2;
g_(4)=g(3);

for i=1:N
    m(1)=(d(1)-d(3))*g_(1);
    m(2)=(d(2)+d(3))*g_(2);
    m(3)=(d(3)-d(1))*g_(3);
    m(4)=(d(2)-d(4))*g_(4);
    r0=m(1)+m(2)+m(3);
    r1=m(2)-m(3)-m(4);
end


