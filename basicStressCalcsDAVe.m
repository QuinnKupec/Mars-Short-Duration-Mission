%% Basic Strructures Calcs
%density = 2.81; % g/cm3
E = 71.7*10^9;
outerRad = 3.2;
thick = 5/1000;
Tdescent = 70000*4;
syAl = 5.03*10^8; % 7075-t6 Al;
shearStrength = 331*10^6;
DAVeMass = 37962; % kg
maxGs  = 5;
gMars = 3.711;
FS = 1.5; % NASA min is 1.25 for metals

DMax = 7.400*10^6; % N
CXAshell = pi*(outerRad^2)-pi*(outerRad-thick)^2;
Ashield = 157118673.8/(1000^2);
maxGload = maxGs*gMars*DAVeMass;
maxGloadStressShell = maxGload/CXAshell;
sfGLoad = syAl/maxGloadStressShell


stressShield = DMax/Ashield;
L = 17000/1000;
CXAlong = L*thick;
dragStress = DMax/CXAlong;
SFDrag = syAl/dragStress 
shearDrag = DMax/CXAshell;
sfDragShear =  shearStrength/shearDrag


maxFShell = CXAshell * syAl/FS;
stressThrust = Tdescent/CXAshell;
SFThrust = syAl/stressThrust

transferLoad = 315*10^3;
transferStress = transferLoad/CXAshell;
SFTransfer = syAl/transferStress

%% Buckling
I = pi/4*(outerRad^4-thick^4);
pcr = (pi^2*E*I)/(4*L^2)

%% Launch Loads
launchGs = 6;
earthG = 9.8;

launchLoad = launchGs*earthG*DAVeMass;
launchStress = launchLoad/CXAshell;
SFlaunch = syAl/launchStress

%% Landing Gear
outerRad = 170/2000;
innerRad = 150/2000;
F = (DAVeMass*gMars*2)/4;
A = pi*(outerRad-innerRad)^2;
stressGear = F/A;
SFGear = syAl/stressGear

%% Crew PV 
t = 5/1000;
pvRad = 2;
hoopStressCrew = 70*10^3*pvRad/t;
SFPV = syAl/hoopStressCrew

%% Crew PV 
t = 5/1000;
pvRad = 2.5;
hoopStressAirlock = 70*10^3*pvRad/t;
SFPV = syAl/hoopStressAirlock