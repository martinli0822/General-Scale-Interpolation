clc;
clear;
picnames = [{'airplane'},{'baboon'},{'barbara'},{'bike'},{'cameraman'},{'caps'},{'child'},{'house'},{'lena'},{'lighthouse'},{'monarch'},{'pepper'},{'ruler'},{'sailboat'},{'slope'},{'statue'},{'tulip'},{'woman'}];

% 1.5
disp(['Sclaing Factor: 1.5']);
disp(['----------------------']);
tic;
for i = 1:18
    name = char(picnames(i));
    lrname = strcat(name, '-LR-1_5.png');
    hrname = strcat(name, '.png');
    LR = imread(strcat('LR\1.5\',lrname));
    HR = imread(strcat('HR\1.5\',hrname));
    a = MyBicubic(LR, 1.5);
    b = isvc(LR, 1.5);
    a = uint8(a);
    b = uint8(b);
    
    disp([name,':']);
    x1 = HR;
    x2 = a;
    PSNR;
    x2 = b;
    PSNR;
    disp(['----------------------']);
    
    t = '-BC';
    t = strcat(name,t);
    imwrite(a, strcat('results\1.5\',strcat(t, '.png')), 'png');

    t = '-SVC';
    t = strcat(name,t);
    imwrite(b, strcat('results\1.5\',strcat(t, '.png')), 'png');
end
toc;

% % 1.7
% disp(['Sclaing Factor: 1.7']);
% disp(['----------------------']);
% tic;
% for i = 1:18
%     name = char(picnames(i));
%     lrname = strcat(name, '-LR-1_7.png');
%     hrname = strcat(name, '.png');
%     LR = imread(strcat('LR\1.7\',lrname));
%     HR = imread(strcat('HR\1.7\',hrname));
%     a = MyBicubic(LR, 1.7);
%     b = isvc(LR, 1.7);
%     a = uint8(a);
%     b = uint8(b);
%     
%     disp([name,':']);
%     x1 = HR;
%     x2 = a;
%     PSNR;
%     x2 = b;
%     PSNR;
%     disp(['----------------------']);
%     
%     t = '-BC';
%     t = strcat(name,t);
%     imwrite(a, strcat('results\1.7\',strcat(t, '.png')), 'png');
% 
%     t = '-ISVC';
%     t = strcat(name,t);
%     imwrite(b, strcat('results\1.7\',strcat(t, '.png')), 'png');
% end
% toc;

% % 2.0
% disp(['Sclaing Factor: 2.0']);
% disp(['----------------------']);
% for i = 1:18
%     name = char(picnames(i));
%     lrname = strcat(name, '-LR.png');
%     hrname = strcat(name, '.png');
%     LR = imread(strcat('LR\2.0\',lrname));
%     HR = imread(strcat('HR\2.0\',hrname));
%     a = MyBicubic(LR, 2);
%     b = isvc(LR, 2);
%     a = uint8(a);
%     b = uint8(b);
%     
%     disp([name,':']);
%     x1 = HR;
%     x2 = a;
%     PSNR;
%     x2 = b;
%     PSNR;
%     disp(['----------------------']);
%     
%     t = '-BC';
%     t = strcat(name,t);
%     imwrite(a, strcat('results\2.0\',strcat(t, '.png')), 'png');
% 
%     t = '-ISVC';
%     t = strcat(name,t);
%     imwrite(b, strcat('results\2.0\',strcat(t, '.png')), 'png');
% end

% % check PSNR
% disp(['Sclaing Factor: 1.5']);
% disp(['----------------------']);
% for i = 1:18
%     name = char(picnames(i));
%     lrname = strcat(name, '-ISVC.png');
%     bcname = strcat(name, '-BC.png');
%     hrname = strcat(name, '.png');
%     LR = imread(strcat('results\1.5\',lrname));
%     HR = imread(strcat('HR\1.5\',hrname));
%     BC = imread(strcat('results\1.5\',bcname));
%     disp([name,':']);
%     x1 = HR;
%     x2 = BC;
%     PSNR;
%     x2 = LR;
%     PSNR;
%     disp(['----------------------']);
% end