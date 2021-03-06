gamma = 1.28;
R = 188.92;
A = 74.8899;
cd = 1.2;
V = V*1000;
h = h*1000;

if h < 46000
    
    if h > 7000
        T = -23.4-.00222*h;
        p = .699-exp(-.00009*h); %kPa
    else 
        T = -31-.00998*h*1000;
        p = .699-exp(-.00009*h); %kPa
    end

%rho = p/(.1921*(T+273.1));
rho = (p*1000)/(R*(T+273.1)); % kg/m3
else
    rho = 0;
end
% a = sqrt(gamma*R*(T+273.1));
% M = v/a;
d = .5*rho*v^2*A*cd;
D(1) = -.5*rho*V(1)^2*A*cd; %kg*m/s^2
D(2) = -.5*rho*V(2)^2*A*cd;
D(3) = -.5*rho*V(3)^2*A*cd;

D = D/1000;