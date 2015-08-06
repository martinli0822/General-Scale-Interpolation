%% whole pic
clc;
clear;
picnames = [{'airplane'},{'baboon'},{'barbara'},{'bike'},{'cameraman'},{'caps'},{'child'},{'house'},{'lena'},{'lighthouse'},{'monarch'},{'pepper'},{'ruler'},{'sailboat'},{'slope'},{'statue'},{'tulip'},{'woman'}];
% generate 1.5 LR & HR
for i = 1:18
    name = char(picnames(i));
    HR = imread(sprintf('HR\\2.0\\%s.png', name));
    [h w r] = size(HR);
    LR = MyBicubic(HR, 1/1.5);
    LR = uint8(LR);
    imwrite(LR, sprintf('LR\\1.5\\%s-LR-1_5.png', name));
    if h == 256
        imwrite(HR, sprintf('HR\\1.5\\%s.png', name))
    else
        imwrite(HR(1:h-1, 1:w-1), sprintf('HR\\1.5\\%s.png', name));
    end
end
