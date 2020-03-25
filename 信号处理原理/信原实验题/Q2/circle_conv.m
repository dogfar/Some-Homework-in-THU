function f2 = circle_conv (x, y)
    M = length(x); 
    N = length(y);
    L = M + N - 1;
    x = [x, zeros(1, N - 1)];
    y = [y, zeros(1, M - 1)];
    f2 = ifft(fft(x) .* fft(y));
end