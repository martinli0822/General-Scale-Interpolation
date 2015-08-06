function [output] = MyBicubic(LR,scale)
 
a=double(LR);
[m,n,c]=size(a);
p = scale;

X1 = (1:(1/p):n);
Y1 = (1:(1/p):m)';

for col = 1:c
    temp = interp2(a(:,:,col),X1,Y1,'cubic');
    for i=1:(p-1)
        temp(:,end+1) = temp(:,end);
        temp(end+1,:) = temp(end,:);
    end
    output(:,:,col) = temp;
end

%output = output/255.0;
