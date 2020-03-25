% ref https://www.cnblogs.com/haibin-zhang/p/5515607.html
function ans2 = goertzel(sound)
    flist = [697, 770 ,852, 941, 1209, 1336, 1477, 1633];
    fs = 44100;
    N = length(sound);
    K = flist * N / fs;
    result = zeros(1, 8);
    q1 = 0;
    q2 = 0;
    q3 = 0;
    for i = 1:8
        C = 2 * cos(2 * pi * K(i) / N);
        q1 = 0;
        q2 = 0;
        q3 = 0;
        for j = 3 : N-3
            q0 = C * q1 - q2 + sound(j);
            q2 = q1;
            q1 = q0;
        end
        result(i) = q1 ^ 2 + q2 ^ 2 - C * q1 * q2;
    end
    result = abs(result);
    row = find(result(1:4) == max(result(1:4)));
    col = find(result(5:8) == max(result(5:8)));
    
    ans2 = '';
    keys = ['1', '2', '3', 'A';'4','5','6','B';'7','8','9','C';'*','0','#','D'];
    ans2 = keys(row, col);
end