set(0,'defaulttextinterpreter','latex');
set(0, 'defaultAxesTickLabelInterpreter','latex');
set(0,'defaultAxesFontName', 'TeX Gyre Schola Math');
set(0,'defaultAxesFontSize',20);

clc;
clear;

steps = [0:10:1000];
nx = 1024;
np = 1024;
Xmin = -20;
Xmax = 20;
Pmin = -20;
Pmax = 20; 

X = linspace(Xmin,Xmax,nx);
P = linspace(Pmin,Pmax,np);

Xb = linspace(-15, 15, 1024);
Pb = linspace(-15, 15, 1024);

[x,p] = meshgrid(Xb,Pb);
barrier = (p.*p)/(2) + 0.01*x.^4 - 0.5*4*x.^2;%0*exp(-(x+0).*(x+0)/(500));
matrix = zeros(nx, np);

tic
for i = steps
disp(i)
%%
if i == 0
%%
myfilename= 'gaussian_rank2_0.txt';
filename = fullfile('C:\','Users','user','Desktop','PhaseSpace','PhaseSpaceAGH','src','data','dump',myfilename);
matrix=importdata(filename,' ');

m0 = max(max(matrix));

%%
f = figure();

s = imagesc(X,P,matrix');
set(gca,'YDir','normal')
%,'EdgeColor','none');
%s.EdgeColor = 'none';
%view(0,90);
hold on
contour(Xb,Pb,barrier,20, '-k')

axis([-15 15 -15 15]);
grid off
box on
%alpha(0.8);
titlename = {'t = 0 a.u.'};
title(titlename)

colormap(redblue)
colorbar
caxis([-m0 m0]);
xlabel('x [a.u.]');
ylabel('p [a.u.]');
%%
savename = sprintf('t000%i', i);
saveas(f,savename,'png');
close(f);
%%
elseif (i > 0) && (i <= 999)
%%
myfilename= sprintf('gaussian_rank2_%i.txt',i);
filename = fullfile('C:\','Users','user','Desktop','PhaseSpace','PhaseSpaceAGH','src','data','dump',myfilename);
matrix=importdata(filename,' ');

m = max(max(matrix));
if m > m0
    m0 = m;
end
%%
f = figure();

s = imagesc(X,P,matrix');
set(gca,'YDir','normal')
%s.EdgeColor = 'none';
%view(0,90);
hold on
contour(Xb,Pb,barrier,20, '-k')

axis([-15 15 -15 15]);
grid off
box on
titlename = {sprintf('~t = %.2f a.u.', i*0.01)};
title(titlename)

colormap(redblue)
colorbar
caxis([-m0 m0]);
xlabel('x [a.u.]');
ylabel('p [a.u.]');
%%
savename = sprintf('t0%i', i);
saveas(f,savename,'png');
close(f)
%%
else
%%    
myfilename= sprintf('gaussian_rank2_%i.txt',i);
filename = fullfile('C:\','Users','user','Desktop','PhaseSpace','PhaseSpaceAGH','src','data','dump',myfilename);
matrix=importdata(filename,' ');

m = max(max(matrix));
if m > m0
    m0 = m;
end
%%
f = figure();

s = imagesc(X,P,matrix');
set(gca,'YDir','normal')
hold on
contour(Xb,Pb,barrier,20, '-k')

axis([-15 15 -15 15]);
grid off
box on
titlename = {sprintf('~t = %.2f a.u.', i*0.01)};
title(titlename)

colormap(redblue)
colorbar
caxis([-m0 m0]);
xlabel('x [a.u.]');
ylabel('p [a.u.]');
%%
savename = sprintf('t%i', i);
saveas(f,savename,'png');
close(f)
end
end
toc
