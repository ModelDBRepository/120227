n=2;

GMAX = 4; 
TMAX = 5;

tw = 0.4;
Iterations = 18;
g0 = 1.2; %1.2;     % Initial conditions:
w0 = [ 0.1 0.4 0.5 0.5 0.7 0.7 ];
Delay = 0.002;

ghat = 0.8;
gbar = 5;   

r = 0.6;    % Depression parameter
tDep = 10;   % Depression time constant
tSyn = 3;   % Synaptic time constant
wlk = 0.2;  % Left knee
wrk = 0.8;  % Right knee

col = cell(10);    % Colors
col{1} = [1 0 0];   col{2} = [0 0 1];
col{5} = [0 0 0];   col{6} = [0.5 0.5 0.5];
col{4} = [0 0.7 0]; col{3} = [1 0 1];
col{7} = [1 0 0.5]; col{8} = [0 0 0.5];
col{9} = [1 1 0];   col{10}= [1 0.5 0];
