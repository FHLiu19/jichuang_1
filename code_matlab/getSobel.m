function OUT=getSobel(IN,threshold)
    Gx_1=IN(1,3)+2*IN(2,3)+IN(3,3);
    Gx_2=IN(1,1)+2*IN(2,1)+IN(3,1);
    Gx=abs(Gx_1-Gx_2);
    Gy_1=IN(1,1)+2*IN(1,2)+IN(1,3);
    Gy_2=IN(3,1)+2*IN(3,2)+IN(3,3);
    Gy=abs(Gy_1-Gy_2);
    
    G=sqrt(Gx^2+Gy^2);
    if(G<=threshold)
        OUT=255;
    else
        OUT=0;
    end