clc,clear all,close all;
% DTFT Zero padding and Frequency resolution simulation
% Written By: Rasit
% 26-Mar-2024

x = [0 1 2 3];               % Original Signal
Omega = 0:1e-2:2*pi;
Y = exp(-j*Omega)+2*exp(-2*j*Omega)+3*exp(-3*j*Omega);  % Original signal Fourier Transform DTFT
X =  fft(abs(x));   % Original Signal FFT

PaddingSize = 7;
figure('units','normalized','outerposition',[0 0 1 1],'color','w')
for i = 3:PaddingSize
    clf
    subplot(221)
    stem(x,"filled"),axis([-1 17 -1 3])

    subplot(222)
    plot(Omega,real(Y),"r"),hold on
    stem(linspace(0,2*pi,size(real(X),2)),real(X),"filled","b",LineWidth=.5,MarkerSize=4)
    legend("DTFT","FFT")

    xpadding = [0 1 2 3 zeros(1,(2^i)-size(x,2))];  % Zero Padding
    XP = fft(abs(xpadding));

    subplot(223)
    stem(xpadding,"filled"),axis([-1 size(xpadding,2)+1 -1 3])

    subplot(224)
    plot(Omega,real(Y),"r",LineWidth=2),hold on
    stem(linspace(0,2*pi,size(real(XP),2)),real(XP),"filled","b",LineWidth=.5,MarkerSize=4)
    legend("DTFT","FFT")
    drawnow
end