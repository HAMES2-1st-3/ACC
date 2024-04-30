clear
close all
clc

% DC motor
% R = 2;      % Ohms
% L = 0.5;    % Henrys
% Km = 1;     % torque constant
% Kb = 0.1;   % back emf constant
% Kf = 0.01;  % Nms
% J = 0.02;   % kg.m^2/s^2


% gain value
Kp = 0.3;    % P gain
Ki = 1.5;    % I gain
Kd = 0;    % D gain

% type convert value
rpm_scale = 1/12/4*60; % 5/4
cycle_per_rotate = 12;
sec_per_minute = 60;


% system value
RPM_MAX = 5000;
ADC_MAX = 1023;
Ts = 0.05;
UTs = 0.3;

% Low pass filter for Speed
num = 1;
den = [0.03 1];             % Low-Pass filter function: 1/(0.05s + 1)
G = tf(num,den);
Gd = c2d(G, Ts); % c2d 에 필요한 Discrete time(Sampling time) == Ts

num_Gd = Gd.Num{:};         % Low-Pass Filter value
den_Gd = Gd.Den{:};         % Low-Pass Filter denom value
