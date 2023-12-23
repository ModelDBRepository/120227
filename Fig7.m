clear;
figure(1);
hold on;

FigParameters;
n = 4;
TMAX = 10;
gr1 = 0.23; gr2 = 0.28; gr3 = 0.33;

gd = @(t) gbar * (1 - exp(-t/tDep)) ./ (1 - r * exp(-t/tDep));
tt = [0:0.01:TMAX];
plot(gd(tt), tt, ':', 'linewidth', 2, 'color', [0 0 0]); hold on;

legendE = {'t_{in} vs. g_0'};

for N = 1 : n
  gt = @(t) ghat * ( exp(t/tSyn) - wrk/wlk * exp(-N*t/tw + t/tSyn) ); 
  plot(gt(tt), tt, '-', 'linewidth', 1.5, 'color', (n-N)*[gr1 gr2 gr3]); 
  legendE = [legendE; sprintf('{\\bf%d-cluster }', N) ];
end;
legend(legendE, 'location', 'SouthEast');

%----------------------------------------------------------------

for N = 1 : n
  gt = @(t) ghat * ( exp(t/tSyn) - wrk/wlk * exp(-N*t/tw + t/tSyn) ); 
  dg = @(t) gd(t) - gt(t);
  teq = fsolve(dg, [0:TMAX]);
  plot(gt(teq), teq, 'o', 'MarkerFaceColor', (n-N)*[gr1 gr2 gr3], 'MarkerEdgeColor', (n-N)*[gr1 gr2 gr3]);
end;

xlabel('g_0','fontsize',12);
ylabel('Inter-spike interval','fontsize',12);
axis([0 GMAX 0 TMAX]);
set(gca,'box','on');

%saveas(gcf, 'FigLast', 'eps');

