% Lander Structural Analysis
p = 101*10^3;
R = 3.1;
syAl = 503*10^6; % 7075-t6 Al
ml = 29293;
wl = 3.711*ml;
T = 3*wl;
%syms t;
%tT = double(solve(syAl == T/(pi*(R+t)^2-pi*R^2), t))
% t = [0:.00001:7];
% sT = T./(pi.*(R-t).^2-pi.*R.^2);
% plot(t, sT)
th = p*R/syAl
tl = p*R/(2*syAl)
%sh = p*R/t
%sl = (p*R)/(2*t)
