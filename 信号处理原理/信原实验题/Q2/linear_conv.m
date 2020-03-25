function f1 = linear_conv(x, y)
    M = length(x); 
    N = length(y);
    L = M + N - 1;
    f1 = zeros(1, L);
    for k = 1 : L
        ma = min(k, M);
        mi = max(k + 1 - N, 1);
        for j = mi : ma
            f1(k) = f1(k) + x(j) * y(k + 1 - j);
        end
    end
end