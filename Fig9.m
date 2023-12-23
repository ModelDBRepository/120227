clear;
figure(1);
subplot('position',[0.1 0.4 0.8 0.55]); 
hold on;

FigParameters_bistable;
existence_bistable;

options = [];
wLine = [0:0.01:wlk];  % Jump curve
gLine = ghat * (1 - wLine / wlk);

d0 = g0 * r / gbar;    % Initial condition for depression variable

ww = cell(n);
time = [0];
ggg  = [g0];

lstr = {'jump curve'}; % Plot legend 
for i = 1:n
    ww{i} = [w0(i)]; 
    lstr = [lstr; sprintf('cell %d',i)];
end;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%% MAIN LOOP %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

patt = [1 1 1];
clr = 0.9 * patt;
dclr = 0.9 / Iterations;
str = '';

for iter = 1:Iterations 
    
    % Compute first passage times for all cells:
    for i = 1:n  
        eqn = @(t) g0 * exp(-t/tSyn) + ghat / wlk * w0(i) * exp(-t/tw) - ghat;
        t0 = fsolve( eqn, [0 10], options); tSpikei(i) = t0(1);
    end;
    [tSpike, iCell] = min(tSpikei);
    str = sprintf('%s %.1f;', str, tSpike);

    tt = linspace(0, tSpike + Delay ,60);
    time = [time, tt + time(length(time))];
    g00 = g0;
    gg = g0 * exp(-tt/tSyn); 
    ggg = [ggg, gg];
    for i = 1:n
        if tSpikei(i) > tSpike + Delay
          w = w0(i) * exp(-tt/tw);
          ww{i} = [ ww{i}, w ];  
          w0(i) = w0(i) * exp(-(tSpike+Delay)/tw);
        else
          N = length(tt);
          I = find(tt > tSpikei(i));
          if length(I) < 1 
              L = N;
          else
              L = I(1)-1;
          end;
          w = [w0(i) * exp(-tt(1:L)/tw)];
          if L < N
              w = [w, wrk * exp(-(tt(L+1:N) - tSpikei(i))/tw) ];
          end;
          ww{i} = [ ww{i}, w ];
          w0(i) = wrk * exp(-(tSpike + Delay - tSpikei(i))/tw);
        end;
    end;

    d0 = 1 - (1 - d0) * exp(-(tSpike + Delay)/tDep);
    if (gbar * d0 > gg(length(gg))) 
        g0 = gbar * d0;
    else
        fprintf('Depression variable smaller than s(t)\n');
        g0 = gg(length(gg));
    end;
    d0 = d0 * r;

    subplot('position',[0.1 0.1 0.8 0.2]); 
    set(gca,'box','on'); 
    hold off;
    for i = 1:n
        plot(time, ww{i}+i-1, 'b-'); hold on; 
        if iter == Iterations, text(0, i, sprintf('w_%d',n-i+1)); end;
    end;
    if iter == Iterations, text(0, n, 'B', 'fontsize', 20); end;
    axis([0 time(length(time)) 0 n]);
    xlabel(sprintf('Interspike intervals = %s',str));  
    set(gca,'Ytick',[]);
    hold off;

    subplot('position',[0.1 0.4 0.8 0.55]); hold on;
    clr = clr - dclr * patt;
    if clr(1)<0 
        clr = [0 0 0]; 
    end;
    plot(g00, tSpike, 'ok', 'markersize', 2, 'MarkerEdgeColor', clr, 'MarkerFaceColor', clr, 'MarkerSize', 6);
    legendE = [legendE; sprintf('Interval #%d', iter) ];
    if iter == 1, text(0.04, TMAX, 'A', 'fontsize', 20); end;
    drawnow;
end;
legend(legendE, 'location', 'SouthEast');

subplot('position',[0.1 0.1 0.8 0.2]); 
for i = 1:n
  text(-15, i+0.8, sprintf('w_%d',n-i+1));
end;

%figure(1); for i = 1:6; subplot(6,1,i); plot(time, ww{i}); end;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%% THE END %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%