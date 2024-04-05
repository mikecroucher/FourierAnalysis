clc,clear,close all,warning off;
% Least Squares Based Trigonometric Fourier Series
% Written By: Rasit Evduzen
% 05-Apr-2024
%% LSE Based Fourier Series Decomposition

TimeVec = linspace(-2,2,1e3)';
SignalSquareWave = square(TimeVec*2*pi);
SignalSawWave = sawtooth(TimeVec*2*pi);

NoHmax = 2e2; % Number of Harmonics
figure('units','normalized','outerposition',[0 0 1 1],'color','w')
for NoH = 1:NoHmax

    ASquare = [];
    bSquare = SignalSquareWave;
    for i=1:NoH
        ASquare = [ASquare sin(TimeVec*i)];
    end

    xLseSquare = ASquare\bSquare;   % LSE Solution -> inv(A'*A)*A'*b;
    FSsignalSquareWave = 0;
    for i=1:NoH
        FSsignalSquareWave = [FSsignalSquareWave +  xLseSquare(i)*sin(TimeVec*i)];
    end

    ASaw = [];
    bSaw = SignalSawWave;
    for i=1:NoH
        ASaw = [ASaw sin(TimeVec*i)];
    end

    xLseSaw = ASaw\bSaw;   % LSE Solution -> inv(A'*A)*A'*b;
    FSsignalSawWave = 0;
    for i=1:NoH
        FSsignalSawWave = [FSsignalSawWave +  xLseSaw(i)*sin(TimeVec*i)];
    end

    % Plot Result
    clf
    subplot(121)
    plot(TimeVec,SignalSquareWave,'r',LineWidth=5),hold on,grid
    plot(TimeVec,FSsignalSquareWave,'k',LineWidth=3)
    title(["Square Wave LSE Based Fourier Series Decomposition", "Number of Harmonics -> "+num2str(NoH)])
    xlabel("Time [Sn]"),ylabel("Square Wave"),axis([min(TimeVec) max(TimeVec) -1.5 1.5])

    subplot(122)
    plot(TimeVec,SignalSawWave,'r',LineWidth=5),hold on,grid
    plot(TimeVec,FSsignalSawWave,'k',LineWidth=3)
    title(["SawTooth Wave LSE Based Fourier Series Decomposition", "Number of Harmonics -> "+num2str(NoH)])
    xlabel("Time [Sn]"),ylabel("SawTooth Wave"),axis([min(TimeVec) max(TimeVec) -1.5 1.5])

    drawnow
end

