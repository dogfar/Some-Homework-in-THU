function ans1 = fft_decode(sound)
    result = reshape((abs(fft(sound, 44100))), 44100, 1);
    maxrow = max(result(680:950));
    row = find(result(680:950) == maxrow);
    row = row + 678;
    maxcol = max(result(1200:1650));
    col = find(result(1200:1650) == maxcol);
    col = col + 1198;
    ans1 = '';
    keys = ['1', '2', '3', 'A';'4','5','6','B';'7','8','9','C';'*','0','#','D'];
    frow = [697, 770, 852, 941];
    fcol = [1209, 1336, 1477, 1633];
    if(result(row) > 100 && result(col) > 100) %设定阈值，小于100的能量被认为是杂音情况
        mht_dis_row = abs(frow - row);
        mht_dis_col = abs(fcol - col);
        r = find(mht_dis_row == min(mht_dis_row));
        c = find(mht_dis_col == min(mht_dis_col));
        ans1 = keys(r, c);
    end
end