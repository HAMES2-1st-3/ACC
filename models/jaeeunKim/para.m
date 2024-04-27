clear
close all
clc

% DC motor
R = 2;      % Ohms
L = 0.5;    % Henrys
Km = 1;     % torque constant
Kb = 0.1;   % back emf constant
Kf = 0.01;  % Nms
J = 0.02;   % kg.m^2/s^2

Wref = 4000; % reference RPM
Kp = 0.0001;   % P gain
Ki = 0.003;    % I gain


encoder_scale = 1/12/4 * 2 * pi;    % rad/s scale
rpm_scale = 1/12/4*60;
rpm2encoder = 1/60*2*pi;
pot2rpm = 5000/1023;
% Low pass filter for Speed
num = 1;
den = [0.03 1];             % Low-Pass filter function: 1/(0.05s + 1)
Ts = 0.01;                  % Sample Time
G = tf(num,den);
Gd = c2d(G, Ts); % c2d 에 필요한 Discrete time(Sampling time) == Ts

num_Gd = Gd.Num{:};         % Low-Pass Filter value
den_Gd = Gd.Den{:};         % Low-Pass Filter denom value


ACCmode = 0;
submode = 0;
dist = 0.5;
dir = 0;