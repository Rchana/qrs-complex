load('106m.mat')
ecg = val/200;
samplingRate= 360;
ecg = ecg-mean(ecg);
ecgSection = ecg(1:100000);
dt = 1/samplingRate;
time = linspace(0, dt*length(ecgSection), length(ecgSection));
plot(time, ecgSection), xlabel('Time (s)'), ylabel('amplitude (mV)')
indices = findQRS(ecgSection);
hold on, plot(indices*dt, 0, 'rx')
load('106m.mat')