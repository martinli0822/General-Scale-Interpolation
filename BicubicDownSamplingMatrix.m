function D = BicubicDownSamplingMatrix(s, M, N, m, n, ikstart, jkstart, ci, cj, sort)

% 5x5
% sort = [10 25 24 23 22 11 6 5 9 21 12 2 1 4 20 13 7 3 8 19 14 15 16 17 18];
% 18];
% 7x7
% sort = [26 49 48 47 46 45 44 27 10 25 24 23 22 43 28 11 6 5 9 21 42 29 12 2 1 4 20 41 30 13 7 3 8 19 40 31 14 15 16 17 18 39 32 33 34 35 36 37 38];
% 9x9
sort = [50 81 80 79 78 77 76 75 74 51 26 49 48 47 46 45 44 73 52 27 10 25 24 23 22 43 72 53 28 11 6 5 9 21 42 71 54 29 12 2 1 4 20 41 70 55 30 13 7 3 8 19 40 69 56 31 14 15 16 17 18 39 68 57 32 33 34 35 36 37 38 67 58 59 60 61 62 63 64 65 66];
% 11x11
% sort = [82 121 120 119 118 117 116 115 114 113 112 83 50 81 80 79 78 77 76 75 74 111 84 51 26 49 48 47 46 45 44 73 110 85 52 27 10 25 24 23 22 43 72 109 86 53 28 11 6 5 9 21 42 71 108 87 54 29 12 2 1 4 20 41 70 107 88 55 30 13 7 3 8 19 40 69 106 89 56 31 14 15 16 17 18 39 68 105 90 57 32 33 34 35 36 37 38 67 104 91 58 59 60 61 62 63 64 65 66 103 92 93 94 95 96 97 98 99 100 101 102];
D = zeros(m*n, N*M);

xi = 0;
yi = 0;
for ii = 1 : (m * n)
    
    fx = 1 + (ikstart + xi) * s;
    fy = 1 + (jkstart + yi) * s;
    
    xi = xi + 1;
    if xi == m
        xi = 0;
        yi = yi + 1;
    end

    error = 1e-10;
    px = fx - (ci - (M - 1) / 2 - 1);
    py = fy - (cj - (N - 1) / 2 - 1);
    if px - floor(px) > 0.99999
        px = px + error;
    end
    if py - floor(py) > 0.99999
        py = py + error;
    end

    x = floor(px);
    y = floor(py);
    x1 = x - 1;
    y1 = y - 1;
    x2 = x;
    y2 = y;
    x3 = x + 1;
    y3 = y + 1;
    x4 = x + 2;
    y4 = y + 2;
    u = px - x;
    v = py - y;
    
    su1 = S(u + 1);
    su2 = S(u + 0);
    su3 = S(u - 1);
    su4 = S(u - 2);
    
    sv1 = S(v + 1);
    sv2 = S(v + 0);
    sv3 = S(v - 1);
    sv4 = S(v - 2);

    T = M*N;
    
    p1 = (y1 - 1) * M + x1;
    p2 = (y2 - 1) * M + x1;
    p3 = (y3 - 1) * M + x1;
    p4 = (y4 - 1) * M + x1;
    
    p5 = (y1 - 1) * M + x2;
    p6 = (y2 - 1) * M + x2;
    p7 = (y3 - 1) * M + x2;
    p8 = (y4 - 1) * M + x2;
    
    p9  = (y1 - 1) * M + x3;
    p10 = (y2 - 1) * M + x3;
    p11 = (y3 - 1) * M + x3;
    p12 = (y4 - 1) * M + x3;
    
    p13 = (y1 - 1) * M + x4;
    p14 = (y2 - 1) * M + x4;
    p15 = (y3 - 1) * M + x4;
    p16 = (y4 - 1) * M + x4;
    
    if x == 1 && y == 1
        p1 = p6;
        p2 = p6;
        p3 = p7;
        p4 = p8;
        p5 = p6;
        p9 = p10;
        p13 = p14;
    end
    
    if x == 1 && y > 1 && y < N - 1
        p1 = p5;
        p2 = p6;
        p3 = p7;
        p4 = p8;
    end
    if x == M && y > 1 && y < N - 1
        p9 = p5;
        p10 = p6;
        p11 = p7;
        p12 = p8;
        p13 = p9;
        p14 = p10;
        p15 = p11;
        p16 = p12;
    end
    if x == M - 1 && y > 1 && y < N - 1
        p13 = p9;
        p14 = p10;
        p15 = p11;
        p16 = p12;
    end
    if x == 1 && y == N - 1
        p1 = p5;
        p2 = p6;
        p3 = p7;
        p4 = p7;
        p8 = p7;
        p12 = p11;
        p16 = p15;
    end
    if x == M - 1 && y == N - 1
        p4 = p3;
        p8 = p7;
        p12 = p11;
        p13 = p9;
        p14 = p10;
        p15 = p11;
        p16 = p11;
    end
    if x == M - 1 && y == N
        p3 = p2;
        p4 = p3;
        p7 = p6;
        p8 = p6;
        p11 = p10;
        p12 = p10;
        p13 = p9;
        p14 = p10;
        p15 = p10;
        p16 = p10;
    end
    if x == M && y == N - 1
        p4 = p3;
        p8 = p7;
        p9 = p5;
        p10 = p6;
        p11 = p7;
        p12 = p7;
        p13 = p5;
        p14 = p6;
        p15 = p7;
        p16 = p7;
    end
        
    if x == 1 && y == N
        p1 = p5;
        p2 = p6;
        p3 = p6;
        p4 = p6;
        p7 = p6;
        p8 = p6;
        p11 = p10;
        p12 = p10;
        p15 = p14;
        p16 = p14;
    end
        
    if x > 1 && x < M - 1 && y == 1
        p1 = p2;
        p5 = p6;
        p9 = p10;
        p13 = p14;
    end
    if x > 1 && x < M - 1 && y == N - 1
        p4 = p3;
        p8 = p7;
        p12 = p11;
        p16 = p15;
    end
    if x > 1 && x < M - 1 && y == N
        p3 = p2;
        p4 = p3;
        p7 = p6;
        p8 = p7;
        p11 = p10;
        p12 = p11;
        p15 = p14;
        p16 = p15;
    end
    if x == M - 1 && y == 1
        p1 = p2;
        p5 = p6;
        p9 = p10;
        p13 = p10;
        p14 = p10;
        p15 = p11;
        p16 = p12;
    end
    if x == M && y == 1
        p1 = p2;
        p5 = p6;
        p9 = p6;
        p10 = p6;
        p11 = p7;
        p12 = p8;
        p13 = p6;
        p14 = p6;
        p15 = p7;
        p16 = p8;
    end
    if x == M && y == N
        p3 = p2;
        p4 = p3;
        p7 = p6;
        p8 = p7;
        p9 = p5;
        p10 = p6;
        p11 = p7;
        p12 = p7;
        p13 = p5;
        p14 = p6;
        p15 = p7;
        p16 = p7;
    end
    
    if p1 == -18
        ttt = 1;
    end
    p1 = sort(p1);
    p2 = sort(p2);
    p3 = sort(p3);
    p4 = sort(p4);
    p5 = sort(p5);
    p6 = sort(p6);
    p7 = sort(p7);
    p8 = sort(p8);
    p9 = sort(p9);
    p10 = sort(p10);
    p11 = sort(p11);
    p12 = sort(p12);
    p13 = sort(p13);
    p14 = sort(p14);
    p15 = sort(p15);
    if p16 == 50
        tttt = 1;
    end
    p16 = sort(p16);
    
    D(ii, p1) = D(ii, p1) + su1 * sv1;
    D(ii, p2) = D(ii, p2) + su1 * sv2;
    D(ii, p3) = D(ii, p3) + su1 * sv3;
    D(ii, p4) = D(ii, p4) + su1 * sv4;
    D(ii, p5) = D(ii, p5) + su2 * sv1;
    D(ii, p6) = D(ii, p6) + su2 * sv2;
    D(ii, p7) = D(ii, p7) + su2 * sv3;
    D(ii, p8) = D(ii, p8) + su2 * sv4;
    D(ii, p9) = D(ii, p9) + su3 * sv1;
    D(ii, p10) = D(ii, p10) + su3 * sv2;
    D(ii, p11) = D(ii, p11) + su3 * sv3;
    D(ii, p12) = D(ii, p12) + su3 * sv4;
    D(ii, p13) = D(ii, p13) + su4 * sv1;
    D(ii, p14) = D(ii, p14) + su4 * sv2;
    D(ii, p15) = D(ii, p15) + su4 * sv3;
    D(ii, p16) = D(ii, p16) + su4 * sv4;

end
end