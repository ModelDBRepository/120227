figure(1);
hold on;

gd = @(t) gbar * (1 - exp(-t/tDep)) ./ (1 - r * exp(-t/tDep));
tt = [0:0.01:TMAX];
plot(gd(tt), tt, ':', 'linewidth', 2, 'color', [0 0 0]); hold on;

legendE = {'t_{in} vs. g_0'};

for N = 2 : 2
  gt = @(t) ghat * ( exp(t/tSyn) - wrk/wlk * exp(-N*t/tw + t/tSyn) ); 
  plot(gt(tt), tt, '-r', 'linewidth', 1.5); 
  legendE = [legendE; 't_{g_0} vs. g_0' ];
end;

xlabel('Synaptic conductance at spike time, g_0','fontsize',12);
ylabel('Inter-spike interval','fontsize',12);
axis([0 GMAX 0 TMAX]);
set(gca,'box','on');


