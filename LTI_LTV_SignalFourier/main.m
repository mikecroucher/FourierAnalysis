clc,clear all,close all;
% LTI and LTV Signal Fourier Transform
% 09-Mar-2024
% Written By: Rasit
%% Create Data
Ts = 1e-2; % Sampling Periode
Fs = 1/Ts; % Sampling Freq
t = (0:Ts:2-Ts)'; % Time Vec
NoD = size(t,1); % Number Of Data
f0 = 5;  % Signal Freq
f1 = 10;  % Signal Freq
LTISignal = 1*cos(2*pi*f0*t) + 1*cos(2*pi*f1*t); % LTI Signal
LTVSignal = [1*cos(2*pi*f0*t(1:end/2)); 1*cos(2*pi*f1*t(end/2:end-1))]; % LTV Signal


figure('units','normalized','outerposition',[0 0 1 1],'color','w')
subplot(221)
plot(t,LTISignal,"r",LineWidth=2)
xline(0),yline(0)
xlabel('Time (seconds)')
ylabel('Amplitude')
title("Time Invariant Signal")
axis([-.5 2.5 -2.5 2.5])
text(.5,-1.5,'\leftarrow cos(2\pi5t) + cos(2\pi10t)',FontSize=15)

subplot(222)
plot(t,LTVSignal,"r",LineWidth=2)
xline(0),yline(0)
xline(t(end/2),"b")
xlabel('Time (seconds)')
ylabel('Amplitude')
title("Time Varying Signal")
axis([-.5 2.5 -1.5 1.5])
text(.1,1.1,'\leftarrow cos(2\pi5t)',FontSize=15)
text(1.1,1.1,'\leftarrow cos(2\pi10t)',FontSize=15)


subplot(223)
plot((0:length(LTISignal)-1)*Fs/length(LTISignal),abs(fft(LTISignal/NoD)),"r",LineWidth=2)
xlabel('Frequency (Hz)'),grid on
ylabel('Magnitude')
title("Frequency Domain")

subplot(224)
plot((0:length(LTVSignal)-1)*Fs/length(LTVSignal),abs(fft(LTVSignal/NoD)),"r",LineWidth=2)
xlabel('Frequency (Hz)'),grid on
ylabel('Magnitude')
title("Frequency Domain")