%% Justifications
%  Description: Includes back-up calculations to support various design
%  decisions for CAD parts and respective dimensions (i.e. rover and
%  cargo-truck wheel dimensions, cargo-truck dimensions)
%  Created by: Cavero, Diego
%              Shah, Saloni

%% Wheels

% School bus
d_sb_wh = 36/39.3701;   % m
m_sb = 29500/2204.62;   % MT
l_sb = 30/3.28084;      % m
% Following based on diff. bus - Type C school buses:
front_overhang_sb = 0.85;   % m
rear_overhang_sb = 3.7; % m

% Rover - Wheels
l_ro = 6;               % m
m_ro = 12;              % MT
d_ro_wh = d_sb_wh*m_ro/m_sb % d_ro_wh = 0.8200 m
t_ro_wh = 8/21*d_ro_wh  % t_ro_wh = 0.3124 m (8/21 prop. from NASA website
                        % on the SMA Spring Tires)
% Supply Pods - Axles Distance
l_sp = 5;               % m
m_ro = 5;               % MT
front_overhang_sp = front_overhang_sb/l_sb*l_sp
rear_overhang_sp = rear_overhang_sb/l_sb*l_sp

%% ATV

% Ranger XP 1000 EPS Matte Titanium Metallic
l_atv = 3.05-0.5;       % m
w_atv = 1.58;           % m
h_atv = 1.96;           % m
r = (3.5 - (2*0.010))/2;% 0.010 m thickness
lim = 2/2;              % 2 in num because I want tolerance for people to
                        % be able to get into vehicle and 2 > w_atv
theta = 0.0;
dis = r*cosd(theta);
while (dis >= lim)
    theta = theta + 0.1;
    dis = r*cosd(theta);
end
%theta = theta - 0.1     % = 54.90
theta = 54.90;          % degrees
width = 2*r*cosd(theta);% = 2.001 m
width_val = 2.003       % want a val > width and base angle on this to
                        % make dimensions for platform user-friendly
theta_val = acosd(width_val/(2*r))
dist_from_center = r*sind(theta_val)% m
height = dist_from_center + r       % m
if (w_atv < width_val && h_atv < height)
    disp('Dimensions work!')
end

%% Supply Pod Calculations

% Based on 7075-Aluminum
P = 68947.539;  % Pa
r = 1.750;      % m (Outer radius)
t = 0.010;      % m (wall thickness)
hoop = P*r/t;
axial = P*r/(2*t);
yield = 503*1e6;% Pa
val = hoop;
if (val > yield)
    disp('Fail')
else
    val
end
SF = 1.5;
max_load = val*SF

% Will use Hubner bellow folding material but cannot find properties, so
% will base on Vulcanised India-Rubber (VIR)
P = 68947.539;  % Pa
r_dock = 1.410/2;    % m (Outer radius)
t_dock = 0.010;      % m (wall thickness)
hoop_dock = P*r_dock/t_dock;
axial_dock = P*r_dock/(2*t_dock);
yield_dock = 28.0*1e6;% Pa
val_dock = hoop_dock;
if (val_dock > yield_dock)
    disp('Fail')
else
    val_dock
end
SF = 1.5;
max_load_dock = val_dock*SF

% Weigth
g_Mars = 3.711;         % m/s/s
mass_rover = 12*1000;   % kg
mass_pod1 = 5*1000;     % kg
mass_pod2 = 5*1000;     % kg
w_rover = mass_rover*g_Mars;
w_pod1 = mass_pod1*g_Mars;
w_pod2 = mass_pod2*g_Mars;
