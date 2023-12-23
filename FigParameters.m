n = 2;      % Number of cells

TMAX = 7;   % Axis limit for the map equilibria plot
GMAX = 6;   % Axis limit for the map equilibria plot

ghat = 0.8;
gbar = 5;   

r = 0.6;    % Depression parameter
tw = 5;   % Recovery time constant
tDep = 10;   % Depression time constant
tSyn = 3;   % Synaptic time constant
wlk = 0.2;  % Left knee
wrk = 0.8;  % Right knee

g0 = 1;     % Initial conditions:
w0 = [ 0.5 0.8 0.3 0.4 0.7 0.7 ];

Delay = 0.0; %0.02;
Iterations = 14; % Number of spikes

col = cell(10);    % Colors
col{1} = [1 0 0];   col{2} = [0 0 1];
col{5} = [0 0 0];   col{6} = [0.5 0.5 0.5];
col{4} = [0 0.7 0]; col{3} = [1 0 1];
col{7} = [1 0 0.5]; col{8} = [0 0 0.5];
col{9} = [1 1 0];   col{10}= [1 0.5 0];
