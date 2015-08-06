x1=double(x1);
x2=double(x2);
[m,n]=size(x1);
[m2,n2]=size(x2);
if m2~=m||n2~=n;
    error('Sizes do not match!');
end;
msevalue=0;
% T = half-(offset+1)/2;
T = 6;
for i=1:m
    for j=1:n
        msevalue=msevalue+(x1(i,j)-x2(i,j))^2;
    end;
end;
msevalue=msevalue/(m*n);
psnrvalue=255^2/msevalue;
psnrvalue=10*log10(psnrvalue);
disp(['PSNR:',num2str(psnrvalue)]);
% disp(['mse:',num2str(msevalue)]);