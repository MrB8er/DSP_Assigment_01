clear all;

% Some parameters to start with
fs_s = 44100;     % sampling frequency
T_s = 5;           %signal duration
f0 = 110;      % fundamental frequency
a_k = 1;        % amplitude
t_s = 0:1/fs_s:T_s-1/fs_s;

N = 5; % number of components

phase = zeros(1,N); % in the case of zero phase

% initialize the signal with a vector of zeros
s1 = zeros(1,fs_s*T_s);  % Where does the fs*T come from?

% now the loop
for kk = 1:N
    s1 = s1 + a_k*sin(2*pi*kk*f0*t_s + phase(kk));
end

% plotting
figure('Name','A cool tone complex!')
plot(t_s,s1, 'lineWidth', 2.0)
xlabel('')
ylabel('')
xlim([0 .01])

%sound(s1, 44100)       %for listening to resulting tone complex
%pause(length(s1) / fs_s);

%----------- Phase is pi half ----------------
phasePiHalf = ones(1, N) * (pi / 2)
s2 = zeros(1,fs_s*T_s);

for kk = 1:N
    s2 = s2 + a_k*sin(2*pi*kk*f0*t_s + phasePiHalf(kk));
end
 hold on

plot(t_s,s2, 'lineWidth', 2.0)
xlabel('')
ylabel('')
xlim([0 .01])

%sound(s2, 44100)
%pause(length(s2) / fs_s);

%----------Phase is randomized between 0 and 2 pi -------------
phaseRand = 2 * pi * rand(1, N)
s3 = zeros(1,fs_s*T_s);
for kk = 1:N
    s3 = s3 + a_k*sin(2*pi*kk*f0*t_s + phaseRand(kk));
end
plot(t_s,s3, 'lineWidth', 2.0)
xlabel('')
ylabel('')
xlim([0 .01])

f0*2^N
%sound(s3, 44100)
%pause(length(s3) / fs_s);
