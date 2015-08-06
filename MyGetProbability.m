function [p] = MyGetProbability(center, compare, d, h1, h2, h3)
    cen1 = center(1);
    com1 = compare(1);
    %% local structure
    max_center = max(center);
    max_compare = max(compare);
    cen = center / (max_center + 0.01);
    com = compare / (max_compare + 0.01);
    diff = sum((cen - com).^2);
    p1 = exp(- diff / (h1));
    
    %% distance
    p2 = exp(- d / (h2));

    p = p1 * p2;
end