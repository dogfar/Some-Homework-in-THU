%ref https://wenku.baidu.com/view/3e39d5bd30126edb6f1aff00bed5b9f3f90f7291.html?from=search
function f4 = overlap_save(x, y)
    M = length(x);
    N = length(y);
    blocknum = ceil(M/(N+1));
    blocksize = N + 1;
    repeatlength = N - 1;
    x = [x, zeros(1, (blocknum+1)*(N+1) - M)];
    Padding_Length = (blocknum+1) * (N+1);
    fy = fft(y, 2* N);
    fill = zeros(1, repeatlength);
    f4 = zeros(1, Padding_Length);
    for i = 1:blocksize:blocknum*blocksize+1
        xi = [fill, x(i:i+blocksize-1)]; %子序列右移
        fill = xi(blocksize + 1 : blocksize + repeatlength); %子序列做卷积
        yi = ifft(fft(xi,blocksize+N-1) .* fy);
        f4(i:i + blocksize - 1) = yi(N:N+blocksize-1);
    end
    f4 = f4(1: M + N -1);
end