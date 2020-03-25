[sound, fz] = audioread('2017011429.wav');
startpoint = 2000;%原始音频开头存在2000个0
total_length = size(sound, 1);
fft_result = [];
goertzel_result = [];
segment_length = 5000;
tic
for i = startpoint:segment_length:total_length-segment_length
   fft_result = [fft_result, fft_decode(sound(i:i+segment_length))]; 
end
toc
fprintf("FFT Results:%s\n", fft_result);
fprintf("-------------------------------------\n");
tic
for i = startpoint:segment_length:total_length-segment_length
   goertzel_result = [goertzel_result, goertzel(sound(i:i+segment_length))]; 
end
toc
fprintf("Goertzel Results:%s\n", goertzel_result);