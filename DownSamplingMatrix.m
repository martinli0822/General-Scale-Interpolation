function D = DownSamplingMatrix(s, M, N, m, n, ikstart, jkstart, ci, cj)
% 5x5
% sort = [10 25 24 23 22 11 6 5 9 21 12 2 1 4 20 13 7 3 8 19 14 15 16 17 18];
% 18];
% 7x7
% sort = [26 49 48 47 46 45 44 27 10 25 24 23 22 43 28 11 6 5 9 21 42 29 12 2 1 4 20 41 30 13 7 3 8 19 40 31 14 15 16 17 18 39 32 33 34 35 36 37 38];
% 9x9
sort = [50 81 80 79 78 77 76 75 74 51 26 49 48 47 46 45 44 73 52 27 10 25 24 23 22 43 72 53 28 11 6 5 9 21 42 71 54 29 12 2 1 4 20 41 70 55 30 13 7 3 8 19 40 69 56 31 14 15 16 17 18 39 68 57 32 33 34 35 36 37 38 67 58 59 60 61 62 63 64 65 66];

D = zeros(m*n, N*M);

xi = 0;
yi = 0;
for ii = 1 : (m * n)
    
%     i = mod(ii, m);
%     if i == 0
%         i = m;
%     end
%     j = ceil(ii / m);
    
    fx = 1 + (ikstart + xi) * s;
    fy = 1 + (jkstart + yi) * s;
    
    xi = xi + 1;
    if xi == m
        xi = 0;
        yi = yi + 1;
    end

    px = fx - (ci - (M - 1) / 2 - 1);
    py = fy - (cj - (N - 1) / 2 - 1);

    x = floor(px);
    y = floor(py);
    x1 = x;
    y1 = y;
    x2 = x + 1;
    y2 = y + 1;
    if x == 7 && y == 7
        aaa = 1;
    end

    T = M*N;
    p1 = (y1 - 1) * M + x1;
    if p1 <= T
        p1 = sort(p1);
        D(ii, p1) = (x2 - px) * (y2 - py);
    end
    p2 = (y2 - 1) * M + x1;
    if p2 <= T
        p2 = sort(p2);
        D(ii, p2) = (x2 - px) * (py - y1);
    end
    p3 = (y1 - 1) * M + x2;
    if p3 <= T
        p3 = sort(p3);
        D(ii, p3) = (px - x1) * (y2 - py);
    end
    p4 = (y2 - 1) * M + x2;
    if p4 <= T
        p4 = sort(p4);
        D(ii, p4) = (px - x1) * (py - y1);
    end

end
D = abs(D);
end
