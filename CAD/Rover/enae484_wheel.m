%% Wheel-Ground Pressure Exertion Calculations
%  Description: Calculates the pressure exerted onto the surface of Mars by
%               the wheel.
%  Created:     10 April 2020
%  Author:      Cavero, Diego

%% Calculations and Assumptions
%  Based on previous assumptions and calculations (See power scripts)

m = 8000;
g = 3.72;
F = m*g;
F_eachwheel = F/6;

%P = 60e3; % Pa

d = 1.202;    % m
l = 0.1*d;  % m

w = 0.1:0.05:1;
len = length(w);
P = zeros(1,len);

for (i = 1:len)
    P(i) = F_eachwheel/(l*w(i));
end

figure(1)
plot(w,P,'k')
grid on
xlabel('Width of wheel (m)')
ylabel('Wheel pressure exerting on ground (Pa)')
title('Ground-Wheel Pressure Exertion (Each Wheel)')

% Comparison resources:
% https://tractors.fandom.com/wiki/Ground_pressure
% Curiosity wheel width and weight
% Lunar rover wheel width and weigth
width = 0.55;   % m - Width of wheel
P = F_eachwheel/(l*width)

% Rolling Resistance
c = 0.275;  % See hi-performance on sand: http://hpwizard.com/tire-friction-coefficient.html
d = ((3.33*F_eachwheel/(width*100*(c^3)))^(1/2))/100 % m
% NGP = F_eachwheel/(d/2*width)