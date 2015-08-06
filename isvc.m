function result = isvc(x, scale, offset)

if nargin < 3
    offset = 3;
end
h1 = 17;
h2 = 33;
h3 = 50000;

% pixel's order
% 50 51 52 53 54 55 56 57 58
% 81 26 27 28 29 30 31 32 59
% 80 49 10 11 12 13 14 33 60
% 79 48 25  6  2  7 15 34 61
% 78 47 24  5  1  3 16 35 62
% 77 46 23  9  4  8 17 36 63
% 76 45 22 21 20 19 18 37 64
% 75 44 43 42 41 40 39 38 65
% 74 73 72 71 70 69 68 67 66

% 7x7
% sort = [26 49 48 47 46 45 44 27 10 25 24 23 22 43 28 11 6 5 9 21 42 29 12 2 1 4 20 41 30 13 7 3 8 19 40 31 14 15 16 17 18 39 32 33 34 35 36 37 38];
% 9x9
% sort = [50 81 80 79 78 77 76 75 74 51 26 49 48 47 46 45 44 73 52 27 10 25
% 24 23 22 43 72 53 28 11 6 5 9 21 42 71 54 29 12 2 1 4 20 41 70 55 30 13 7 3 8 19 40 69 56 31 14 15 16 17 18 39 68 57 32 33 34 35 36 37 38 67 58 59 60 61 62 63 64 65 66];
% 11x11
% sort = [82 121 120 119 118 117 116 115 114 113 112 83 50 81 80 79 78 77 76 75 74 111 84 51 26 49 48 47 46 45 44 73 110 85 52 27 10 25 24 23 22 43 72 109 86 53 28 11 6 5 9 21 42 71 108 87 54 29 12 2 1 4 20 41 70 107 88 55 30 13 7 3 8 19 40 69 106 89 56 31 14 15 16 17 18 39 68 105 90 57 32 33 34 35 36 37 38 67 104 91 58 59 60 61 62 63 64 65 66 103 92 93 94 95 96 97 98 99 100 101 102];

ix=[-1 -1 1  1];
iy=[-1  1 1 -1];

jx=[-1 0 1 0];
jy=[0 1 0 -1];

% hx=[0 -1 0 1 0 -1 -1 1 1 -2 -2 -2 -2 -2 -1 0 1 2 2 2 2 2 1 0 -1 -3 -3 -3 -3 -3 -3 -3 -2 -1 0 1 2 3 3 3 3 3 3 3 2 1 0 -1 -2]
% hy=[0 0 1 0 -1 -1 1 1 -1 -2 -1 0 1 2 2 2 2 2 1 0 -1 -2 -2 -2 -2 -3 -2 -1 0 1 2 3 3 3 3 3 3 3 2 1 0 -1 -2 -3 -3 -3 -3 -3 -3]

hx=[0 -1 0 1 0 -1 -1 1 1 -2 -2 -2 -2 -2 -1 0 1 2 2 2 2 2 1 0 -1 -3 -3 -3 -3 -3 -3 -3 -2 -1 0 1 2 3 3 3 3 3 3 3 2 1 0 -1 -2 -4 -4 -4 -4 -4 -4 -4 -4 -4 -3 -2 -1 0 1 2 3 4 4 4 4 4 4 4 4 4 3 2 1 0 -1 -2 -3 -5 -5 -5 -5 -5 -5 -5 -5 -5 -5 -5 -4 -3 -2 -1 0 1 2 3 4 5 5 5 5 5 5 5 5 5 5 5 4 3 2 1 0 -1 -2 -3 -4];
hy=[0 0 1 0 -1 -1 1 1 -1 -2 -1 0 1 2 2 2 2 2 1 0 -1 -2 -2 -2 -2 -3 -2 -1 0 1 2 3 3 3 3 3 3 3 2 1 0 -1 -2 -3 -3 -3 -3 -3 -3 -4 -3 -2 -1 0 1 2 3 4 4 4 4 4 4 4 4 4 3 2 1 0 -1 -2 -3 -4 -4 -4 -4 -4 -4 -4 -4 -5 -4 -3 -2 -1 0 1 2 3 4 5 5 5 5 5 5 5 5 5 5 5 4 3 2 1 0 -1 -2 -3 -4 -5 -5 -5 -5 -5 -5 -5 -5 -5 -5];
                                                                                                                        %¡ü                                                                             %¡ü
dn=[ 6     7     8     9
    11    13     3     5
     2    15    17     4
     5     3    19    21
    25     2     4    23
    10    12     1    24
    12    14    16     1
     1    16    18    20
    24     1    20    22
    26    28     6    48
    27    29     2    25
    28    30     7     6
    29    31    15     2
    30    32    34     7
    13    33    35     3
     7    34    36     8
     3    35    37    19
     8    36    38    40
     4    17    39    41
     9     8    40    42
    23     4    41    43
    46     9    42    44
    47     5    21    45
    48     6     9    46
    49    11     5    47%];
    50    52    10    80
    51    53    11    49
    52    54    12    10
    53    55    13    11
    54    56    14    12
    55    57    33    13
    56    58    60    14
    31    59    61    15
    14    60    62    16
    15    61    63    17
    16    62    64    18
    17    63    65    39
    18    64    66    68
    19    37    67    69
    20    18    68    70
    21    19    69    71
    22    20    70    72
    45    21    71    73
    76    22    72    74
    77    23    43    75
    78    24    22    76
    79    25    23    77
    80    10    24    78
    81    27    25    79%];
    82    84    26   120
    83    85    27    81
    84    86    28    26
    85    87    29    27
    86    88    30    28
    87    89    31    29
    88    90    32    30
    89    91    59    31
    90    92    94    32
    57    93    95    33
    32    94    96    34
    33    95    97    35
    34    96    98    36
    35    97    99    37
    36    98   100    38
    37    99   101    67
    38   100   102   104
    39    65   103   105
    40    38   104   106
    41    39   105   107
    42    40   106   108
    43    41   107   109
    44    42   108   110
    75    43   109   111
   114    44   110   112
   115    45    73   113
   116    46    44   114
   117    47    45   115
   118    48    46   116
   119    49    47   117
   120    26    48   118
   121    51    49   119];

vn=[ 2     3     4     5
    12     7     1     6
     7    16     8     1
     1     8    20     9
     6     1     9    24
    11     2     5    25
    13    15     3     2
     3    17    19     4
     5     4    21    23
    27    11    25    49
    28    12     6    10
    29    13     2    11
    30    14     7    12
    31    33    15    13
    14    34    16     7
    15    35    17     3
    16    36    18     8
    17    37    39    19
     8    18    40    20
     4    19    41    21
     9    20    42    22
    23    21    43    45
    24     9    22    46
    25     5    23    47
    10     6    24    48%];
    51    27    49    81
    52    28    10    26
    53    29    11    27
    54    30    12    28
    55    31    13    29
    56    32    14    30
    57    59    33    31
    32    60    34    14
    33    61    35    15
    34    62    36    16
    35    63    37    17
    36    64    38    18
    37    65    67    39
    18    38    68    40
    19    39    69    41
    20    40    70    42
    21    41    71    43
    22    42    72    44
    45    43    73    75
    46    22    44    76
    47    23    45    77
    48    24    46    78
    49    25    47    79
    26    10    48    80%];
    83    51    81   121
    84    52    26    50
    85    53    27    51
    86    54    28    52
    87    55    29    53
    88    56    30    54
    89    57    31    55
    90    58    32    56
    91    93    59    57
    58    94    60    32
    59    95    61    33
    60    96    62    34
    61    97    63    35
    62    98    64    36
    63    99    65    37
    64   100    66    38
    65   101   103    67
    38    66   104    68
    39    67   105    69
    40    68   106    70
    41    69   107    71
    42    70   108    72
    43    71   109    73
    44    72   110    74
    75    73   111   113
    76    44    74   114
    77    45    75   115
    78    46    76   116
    79    47    77   117
    80    48    78   118
    81    49    79   119
    50    26    80   120];

y = MyBicubic(x, scale);
x = double(x);
y = double(y);

[MM NN] = size(y);
T = 11;
W = T*T;
half = (T - 1) / 2 + 1;
coreSize = (T - 2)^2;
localSize = 3;
local = localSize^2;
WithProbality = 1;
% % % % % % % % % % % % % % % % % % % % % % % % % % 
dispflag = 0;
% % % % % % % % % % % % % % % % % % % % % % % % % % 
displayWindow = 0;

RCONDTH = 1e-15; 
threshold = 1.0;
vTH = 500;
lambda = 0.5;

toobig = y > 255;
toosmall = y < 0;
y(toobig) = 255;
y(toosmall) = 0;
result = y;
% offset = 1;
count = 0;
total = 0;
xpoint = [];
ypoint = [];
num = 0;
for i = half:offset:(MM - half + 1)
    for j = half:offset:(NN - half + 1)
        total = total + 1;
        r=diag(y(i+hx,j+hy));
        a = var(r);
        if var(r) < vTH
            continue;
        end
        %% computing D
        M = T - 2;
        N = T - 2;
        
        ikstart = ceil((i - 1 - (M - 1) / 2) / scale) + 1;
        ikend = floor((i - 1 + (M - 1) / 2) / scale) + 1;

        jkstart = ceil((j - 1 - (N - 1) / 2) / scale) + 1;
        jkend = floor((j - 1 + (N - 1) / 2) / scale) + 1;
        
        m = ikend - ikstart + 1;
        n = jkend - jkstart + 1;

        Xsquare = x(ikstart:ikend, jkstart:jkend);
        X = Xsquare(:);
        D = BicubicDownSamplingMatrix(scale, M, N, m, n, ikstart - 1, jkstart - 1, i, j);
        %D = DownSamplingMatrix(scale, M, N, m, n, ikstart - 1, jkstart - 1, i, j);
        
        D(m*n, T*T) = 0;

        times = 0;
        flag = 0;
        num = 0;
        
        for k = 1:4
            a(k) = 1/4;
            b(k) = 1/4;
        end
        
        DELTA = 0;
            
        y_for_iter = y;
        p = [];
        prefuncval = 1e10;
        %% iterative processing
        while times < 50
            
            times = times + 1;
            
           %% computing similarity
           if WithProbality
               center = diag(y_for_iter(i+hx(1:local), j+hy(1:local)));
               for k=1:(T - localSize + 1)^2
                   temp = diag(y_for_iter(i+hx(k)+hx(1:local), j+hy(k)+hy(1:local)));
                   p(k) = MyGetProbability(center, temp, (hx(k)^2+hy(k)^2),h1,h2,h3);
               end
           end

           %% C1 and C2
            c1 = size(dn, 1);
            C1 = zeros(c1, W);
            for k = 1 : c1
                C1(k, dn(k, 1)) = a(1);
                C1(k, dn(k, 2)) = a(2);
                C1(k, dn(k, 3)) = a(3);
                C1(k, dn(k, 4)) = a(4);
            end
            
            c2 = size(vn, 1);
            C2 = zeros(c2, W);
            for k = 1 : c2
                C2(k, vn(k, 1)) = b(1);
                C2(k, vn(k, 2)) = b(2);
                C2(k, vn(k, 3)) = b(3);
                C2(k, vn(k, 4)) = b(4);
            end
            
            %% computing r1,r2,r3
            r1 = zeros(coreSize, 1);
            r2 = zeros(coreSize, 1);
            r3 = zeros(m*n, 1);
            Y = [];
            for ii = 1 : W
                Y(ii) = y_for_iter(i+hx(ii), j+hy(ii));
            end
            Y = Y';
            
            temp = eye(c1);
            temp(coreSize, W) = 0;
                        
            
            I1 = temp;
            r1 = (I1 - C1)*Y;

            temp = eye(c2);
            temp(coreSize, W) = 0;
            I2 = temp;
            r2 = (I2 - C2)*Y;

            D(m*n, T*T) = 0;
            r3 = sqrt(lambda)*(X - D*Y);


            lastDELTA = max(abs(DELTA));

            if times >= 10
                tttttttt = 1;
            end

            %% E1 and E2            
            E1 = zeros(coreSize, 4);
            for k = 1 : 4
                E1(:, k) = diag(y_for_iter(i+ix(k)+hx(1:coreSize), j+iy(k)+hy(1:coreSize)));
            end
            E2 = zeros(coreSize, 4);
            for k = 1 : 4
                E2(:, k) = diag(y_for_iter(i+jx(k)+hx(1:coreSize), j+jy(k)+hy(1:coreSize)));
            end
            
            %% probability matrix
            if WithProbality
                t = size(X);
                P = ones(1, coreSize + coreSize + t(1));
                P(1:(T - localSize + 1)^2) = p.*0.2;
                P(coreSize+1:coreSize+(T - localSize + 1)^2) = p.*0.35;
                P = diag(P);
            end
            %% Least-Squares Solution
                
            C1 = C1(:, 1:coreSize);
            C2 = C2(:, 1:coreSize);
            I1 = eye(coreSize);
            I2 = eye(coreSize);
            D = D(:, 1:coreSize);
            
            Z1 = zeros(coreSize, 4);
            dsize = size(D);
            Z2 = zeros(dsize(1), 4);
            C = [(-I1+C1) E1 Z1
                 (-I2+C2) Z1 E2
                 sqrt(lambda)*D Z2 Z2];
             
            E = [r1' r2' r3']';
            
            funcval = E'*E;
%             outputE = [outputE funcval];
            if times > 10 && funcval > prefuncval
%                 plot(outputE);
                break;
            end
            prefuncval = funcval;
            if WithProbality
                K = C'*(P*P);
            else
                K = C';
            end
            if det(K*C) == 0 || rcond(K*C) < RCONDTH
                DELTA = zeros(coreSize + 4 + 4, 1);
            else
                if flag == 0
                    count = count + 1;
                    flag = 1;
                end
                DELTA = inv(K*C)*K*E;
            end
            if max(abs(DELTA)) < threshold
                break;
            end
            
            for ii = 1 : coreSize
                if (i+hx(ii)-1)/scale == fix((i+hx(ii)-1)/scale) && (j+hy(ii)-1)/scale == fix((j+hy(ii)-1)/scale)
                    continue;
                else
                    y_for_iter(i+hx(ii), j+hy(ii)) = y_for_iter(i+hx(ii), j+hy(ii)) + DELTA(ii);
                end
            end
            for ii = coreSize+1 : coreSize+4
                a(ii - coreSize) = a(ii - coreSize) + DELTA(ii);
            end
            for ii = coreSize+5 : coreSize+8
                b(ii - coreSize - 4) = b(ii - coreSize - 4) + DELTA(ii);
            end
        end

        for ii = 1 : offset^2
            if y_for_iter(i+hx(ii), j+hy(ii)) < 0 
                y_for_iter(i+hx(ii), j+hy(ii)) = 0;
            end
            if y_for_iter(i+hx(ii), j+hy(ii)) > 255
                y_for_iter(i+hx(ii), j+hy(ii)) = 255;
            end
            if (i+hx(ii)-1)/scale == fix((i+hx(ii)-1)/scale) && (j+hy(ii)-1)/scale == fix((j+hy(ii)-1)/scale)
                continue;
            else
                result(i+hx(ii), j+hy(ii)) = y_for_iter(i+hx(ii), j+hy(ii));
                y(i+hx(ii), j+hy(ii)) = y_for_iter(i+hx(ii), j+hy(ii));
            end
        end
    end
end
result = uint8(result);
end