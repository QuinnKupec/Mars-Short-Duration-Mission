%% Basic Strructures Calcs
syAl = 503*10^6 % 7075-t6 Al
DAVeMass = 37962; % kg
maxGs  = 5;
gMars = 3.711;
FS = 1.5; % NASA min is 1.25 for metals
Ashell = 877670.37647249/1000^2/2;
maxGload = maxGs*gMars*DAVeMass;
maxGloadStressShell = maxGload/Ashell

maxFShell = Ashell * syAl/FS