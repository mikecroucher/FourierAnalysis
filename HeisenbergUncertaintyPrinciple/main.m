clc,clear all,close all;
% Heisenberg Uncertainty Principle Proof Fourier Transform
% 07-Mar-2024
% Written By: Rasit
%% Create Data
Ts = 2e-2; % Sampling Periode
Fs = 1/Ts; % Sampling Freq
t = (0:Ts:2-Ts)'; % Time Vec
NoD = size(t,1); % Number Of Data
f0 = 1;  % Signal Freq
Signal = 1*cos(2*pi*f0*t); % Signal
Window = zeros(size(Signal,1),1); % Window

figure('units','normalized','outerposition',[0 0 1 1],'color','w')
for i=1:NoD
    Window(i,:) = 1;
    clf
    subplot(121)
    plot(t,Signal.*Window,"r",LineWidth=2)
    xline(0),yline(0)
    xlabel('Time (seconds)')
    ylabel('Amplitude')
    legend("Cos(t)")
    title("Time Domain")
    axis([-.5 2.5 -1.5 1.5])

    subplot(122)
    signalFFT = abs(fft(Signal.*Window));
    plot((0:length(Signal)-1)*Fs/length(Signal),signalFFT,"r",LineWidth=2)
    xlabel('Frequency (Hz)')
    ylabel('Magnitude')
    legend("F\{Cos(t)\}")
    title("Frequency Domain")
    if i == 1
        subplot(121)
        text(0,1,sprintf('   cos(t)*\\delta(t) ','Interpreter', 'latex'),'FontSize',20)
        text(0.1,1.1,"Fully defined in time domain",'FontSize',20)
        subplot(122)
        text(.1,1.2,sprintf('   F\\{cos(t)*\\delta(t)\\} = 1','Interpreter', 'latex'),'FontSize',20)
        text(0.1,1.1,"   Undefined in frequency domain",'FontSize',20)
        pause(2)
    end
    if i == 100
        subplot(121)
        text(0,1.1,sprintf('   cos(t) ','Interpreter', 'latex'),'FontSize',20)
        text(0.1,1.2,"Undefined in time domain",'FontSize',20)
        subplot(122)
        text(.1,45.2,sprintf('    F\\{cos(t)\\} = \\delta(t)','Interpreter', 'latex'),'FontSize',20)
        text(0.1,43.1,"    Fully defined in frequency domain",'FontSize',20)
        pause(2)
    end
    drawnow
end
