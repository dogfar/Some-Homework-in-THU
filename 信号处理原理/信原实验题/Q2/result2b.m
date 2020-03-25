linear = [];
circle = [];
overadd = [];
oversave = [];
for M = 10000:10000:100000
    x = randperm(100000, M);
    y = randperm(100000, M);
    tmp1 = clock;
    result_linear = linear_conv(x, y);
    time1 = etime(clock, tmp1);
    linear = [linear, time1];
    
    tmp2 = clock;
    result_conv = circle_conv(x, y);
    time2 = etime(clock, tmp2);
    circle = [circle, time2];
    
    tmp3 = clock;
    result_oa = overlap_add(x, y);
    time3 = etime(clock, tmp3);
    overadd = [overadd, time3];
    
    tmp4 = clock;
    result_os = overlap_save(x, y);
    time4 = etime(clock, tmp4);
    oversave = [oversave, time4];
end
x = 10000:10000:100000;
plot(x, linear, '-', x, circle, '-', x, overadd, '-', x, oversave, '-');
legend({'linear', 'circle', 'overadd', 'oversave'}, 'Location', 'northwest');
xlabel('Length of X');
ylabel('Time/s');