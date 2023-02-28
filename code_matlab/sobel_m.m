clear;
clc;
close all

%% 
%读取和预处理部分

RGB=imread("C:\Users\FH\Desktop\QQ图片20230223190540.jpg");
gray=0.299*RGB(:,:,1)+0.587*RGB(:,:,2)+0.114*RGB(:,:,3);  % gray=uint8(rgb2gray(RGB));
subplot(2,2,1);
imshow(gray);
title('原图');
%%
%算子定义

X= [ -1  0  1
     -2  0  2
     -1  0  1];
 
Y =[  1  2  1
      0  0  0
     -1 -2 -1];
 
%%
%卷积部分

Gx=convn(gray,X,'same');
Gy=convn(gray,Y,'same');
%%
%阈值判决部分

[R,C]=size(Gx);
threshold=16;

for i=1:3
    threshold=threshold*2;
    for r=1:R
       for c=1:C
          G(r,c)=sqrt(Gx(r,c)^2+Gy(r,c)^2); 
          if (G(r,c)<=threshold)
             bw(r,c)=255;
          else
              bw(r,c)=0;
          end
       end
    end
    subplot(2,2,i+1);
    imshow(bw);
    title("threshold="+threshold);
end

figure;
imshow(uint8(G));


