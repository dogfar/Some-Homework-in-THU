%ref https://wenku.baidu.com/view/3e39d5bd30126edb6f1aff00bed5b9f3f90f7291.html?from=search
function f3 = overlap_add(x, y)
    M = length(x);
    N = length(y);
    blocknum = ceil(M/(N+1));
    blocksize = N + 1;
    repeatlength = N - 1;
    x = [x, zeros(1, (blocknum+1)*(N+1) - M)];
    Padding_Length = (blocknum+1) * (N+1);
    fy = fft(y, 2* N);
    repeat = zeros(1, repeatlength);
    f3 = zeros(1, Padding_Length);
    for i = 1:blocksize:blocknum*blocksize+1
        yi = ifft(fft(x(i:i+blocksize-1),blocksize+N-1) .* fy); %子序列做卷积
        yi(1:repeatlength) = yi(1:repeatlength) + repeat(1:repeatlength);
        repeat(1:repeatlength) = yi(2 * N - repeatlength + 1 : 2 * N); %存下来重复的部分
        f3(i:i + blocksize - 1) = yi(1:blocksize);
    end
    f3 = f3(1: M + N -1);
end