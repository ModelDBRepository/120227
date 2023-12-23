clear;
figure(2);
hold on;

FigParameters;
N = 2;
col1 = [0.5 0.5 0.9];
col2 = [0 0 0];

gd = @(t) gbar * (1 - exp(-t/tDep)) ./ (1 - r * exp(-t/tDep));
tt = [0:0.01:TMAX];
plot(gd(tt), tt, ':', 'linewidth', 2, 'color', [0 0 0]); hold on;
legendE = {'t_{in} vs. g_0'};

%----------------------------------------------------------------

gt = @(t) ghat * ( exp(t/tSyn) - wrk/wlk * exp(-N*t/tw + t/tSyn) ); 
dg = @(t) gd(t) - gt(t);
plot(gt(tt), tt, '-', 'linewidth', 1.5, 'color', col1); 
legendE = [legendE; sprintf('t_{g_0} vs g_0, {\\bf\\tau_w=%g}', tw) ];

%----------------------------------------------------------------
tw = 0.4;
%----------------------------------------------------------------

gt = @(t) ghat * ( exp(t/tSyn) - wrk/wlk * exp(-N*t/tw + t/tSyn) ); 
dg = @(t) gd(t) - gt(t);
plot(gt(tt), tt, '-', 'linewidth', 1.5, 'color', col2); 
legendE = [legendE; sprintf('t_{g_0} vs g_0, {\\bf\\tau_w=%g}', tw) ];

legend(legendE, 'location', 'SouthEast');
teq = fsolve(dg, [0:TMAX]);
plot(gt(teq),teq, 'o', 'color', col2, 'MarkerFaceColor', col2);

xlabel('g_0','fontsize',12);
ylabel('Inter-spike interval','fontsize',12);
axis([0 GMAX 0 TMAX]);
set(gca,'box','on');

%----------------------------------------------------------------
FigParameters;

gt = @(t) ghat * ( exp(t/tSyn) - wrk/wlk * exp(-N*t/tw + t/tSyn) ); 
dg = @(t) gd(t) - gt(t);
plot(gt(tt), tt, '-', 'linewidth', 1.5, 'color', col1); 
legendE = [legendE; sprintf('t_{g_0} vs g_0, {\\bf\\tau_w=%g}', tw) ];
teq = fsolve(dg, [0:TMAX]);
plot(gt(teq),teq, 'o', 'color', col1, 'MarkerFaceColor', col1);



