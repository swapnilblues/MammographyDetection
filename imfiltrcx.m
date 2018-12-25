function grad_xr=imfiltrcx(I,h)

I4=size(I);
[m,n]=size(I);
I1=zeros(m+2,n+2);
 for i=1:m
     for j=1:n
         I1(i+1,j+1)=I(i,j);
     end
 end
 I2=I1;
 for i=2:m+1
     for j=2:n+1
         c=0;
         for k=-1:1
             c=c+I2(i,j+k)*h(k+2);
         end
         I1(i,j)=c;
     end
 end
 for i=1:m
     for j=1:n
         I4(i,j)=I1(i+1,j+1);
     end
 end
 grad_xr=I4;
 
