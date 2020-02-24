% Tipping analysis
%% DAVe
rho = 0.020; % kg/m3
A = 74.8899/2;
windSpeedMax = 30;
Fw = .5*rho*windSpeedMax^2*1.2*A;
Fg = 37962*3.7;

Tg = (4703/1000)*Fg
Tw = (10727.5/2000)*Fw

% solve for max wind speed
syms windSpeedMax;
tipSpeed = double(solve(Tg == (10727.5/2000)*.5*rho*windSpeedMax^2*1.28*A))