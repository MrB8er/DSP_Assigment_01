%% Problem 2 

%2.1.1
clear all;
close all;
clc;

% constants are defined
alpha=0.6;
fs=441;
delay_samples=round(0.03*fs);

% num and den of filter defined
num=[1;zeros(delay_samples,1);alpha];
den=[1;zeros(delay_samples,1);0];

% Freq response
figure(1)
freqz(num,den)

% Impulse response
[s1 s2]=impz(num,den)
fvtool(num,den);

% Sound bit imported
path_2_wav = ['..', filesep, 'HandsOn1_Sounds', filesep];    % the path to the data
fname1 = 'lecture01_demo_aliasing_mini-me_short_16bits.wav';  
[signal, fs_y] = audioread([path_2_wav, fname1]);
%sound(signal, fs_y, 16);

% Design a time vector with the same length as the sound vector
t=0:1/fs_y:length(signal)/(fs_y)-1/fs_y;

%Filtered signal
filtered_signal=filter(num,den,signal);

% plot of sound signal and filtered sound signal
figure(3)
plot(t, signal)
hold on;
plot(t,filtered_signal)
legend('signal', 'filtered signal')
xlim([10 10.1])
title('0.03 ms delay')


%Sound of filtered signal
%sound(filtered_signal, fs_y, 16);


%% 2.1.2

clear all;
close all;
clc;

%constants defined
alpha=0.6;
fs=441;
delay_samples=round(0.03*fs);

% num and den of transfer function
num=[1;zeros(delay_samples,1);0];
den=[1;zeros(delay_samples,1);alpha];

% Freq response
figure(1)
freqz(num,den, [], 441)

% Impulse response
[s1 s2]=impz(num,den)
fvtool(num,den)

% Sound bit imported
path_2_wav = ['..', filesep, 'HandsOn1_Sounds', filesep];    % the path to the data
fname1 = 'lecture01_demo_aliasing_mini-me_short_16bits.wav';  
[signal, fs_y] = audioread([path_2_wav, fname1]);
%sound(signal, fs_y, 16);

% Design a time vector of equal length as the sound signal 
t=0:1/fs_y:length(signal)/(fs_y)-1/fs_y;

%Filtered sound signal
filtered_signal=filter(num,den,signal);

% Display sound signal
figure(3)
plot(t, signal)
hold on;
plot(t,filtered_signal)
legend('signal', 'filtered signal')
xlim([10 12])
title('0.2 ms delay')

%sound(filtered_signal, fs_y, 16);
