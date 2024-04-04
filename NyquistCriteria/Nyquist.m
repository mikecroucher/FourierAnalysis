clc; clear all; close all;
%% 
t = -15:1e-2:15;
w = linspace(-5*pi,5*pi,length(t));
yorg = sinc(t).^2; % Original Function
Mvec = (1:6)/6;
figure('units','normalized','outerposition',[0 0 1 1],'color','w')

for i=1:length(Mvec)
    yn = zeros(1);
    Ts = Mvec(i);
    ts = -15:Ts:15;
    n = ts./Ts; 
    yn = (sinc(ts)).^2;
    
    clf
    subplot(311)
    plot(t,yorg,'r',LineWidth=2),hold on
    stem(ts,yn,"filled","b",LineWidth=.1,MarkerSize=.25)
    xlabel('Time [Sn]'),ylabel('Sinc^2(t)'),axis([-15 15 -.1 1.1])
    title("Original Sinc^2(t) Function Time Domain")
%     title(['M= ' num2str(Mvec(i)) ' ile alt örneklenmiþ sinc^2(ts)']);

    Xfft = zeros(1,length(w));
    for k=1:length(w)
        Xfft(k) = sum(yn.*exp(-j.*w(k).*n));
    end

    subplot(312)
    plot(w,abs(Xfft),'k',LineWidth=2),hold on
    xlabel('\omega (radian)'),ylabel('Sinc^2(w)');
    title("Original Sinc^2(w) Function Frequency Domain")


    
    subplot(313)
    plot(t,abs(ifft(Xfft,'symmetric')),"b",LineWidth=2)
    xlabel('Time [Sn]'),ylabel('Sinc^2(t)'),axis([-15 15 -.1 1.1])
    title("Original Sinc^2(t) Function Recunstruction")


    pause(1)
%     title(['M= ' num2str(Mvec(i)) ' ile alt örneklenmiþ F[sinc^2(M*ts)]']);
    
    % M = 4 deðerinde spektral örtüþme baþlamýþ M = 6 da ile yapýlan
    % örneklemede sadece bir dürtü fonksiyonu oldugu icin fourier dönüþümü
    % bütün eksende F = 1 deðeri almýstýr.
    
end