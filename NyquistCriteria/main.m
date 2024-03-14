clc,clear all,close all;
% Nyquist Sampling Frequency Limit Simulation
% Written By: Rasit
% 10-Mar-2024
%% Creating a impulse train
Fs = 1;         % frequency of impulse
time = (-5:1e-2:5)';  % Time range for impulse train
% Signal = cos(2*pi*Fs*time).*exp(-time); % Signal
Signal = sinc(time);


% impulse train
Fsample = 1;       % sampling frequency with oversampling factor
Ts_sample = 1/Fsample;
t_sample = (min(time):Ts_sample:max(time))';
impulse = ones(size(t_sample));

%% Plot Result

subplot(321)
plot(time,Signal,'r',LineWidth=2),grid on
xlabel("time"),ylabel("Signal"),title("Time Domain")

subplot(322)
plot((0:length(Signal)-1)/Fs,2*abs(fft(Signal))/size(time,1),"r",LineWidth=2)
xlabel('Frequency (Hz)'),grid on
ylabel('Magnitude')
title("Frequency Domain")

subplot(323)
stem(t_sample,impulse,'^','linewidth',2),grid on;
ylabel('Amplitude'),xlabel('Time(sec)');
title('Impulse Train '),ylim([0 2]);

subplot(324)
plot((0:length(impulse)-1)/Fsample,abs(fft(impulse))/size(t_sample,1),"r",LineWidth=2)
xlabel('Frequency (Hz)'),grid on
ylabel('Magnitude')
title("Frequency Domain")
 