set(0,'defaulttextinterpreter','latex');
set(0, 'defaultAxesTickLabelInterpreter','latex');
set(0,'DefaultLineLineWidth', 1.5); 
set(0,'defaultAxesFontName', 'TeX Gyre Schola Math');

clc;
clear;

steps = [0:100:8000];
nx = 1024;
np = 1024;
Xmin = -1500;
Xmax = 1500;
Pmin = -0.5;
Pmax = 0.5; 

X = linspace(Xmin,Xmax,nx);
P = linspace(Pmin,Pmax,np);

matrix_x = zeros(nx);
q0 = zeros(801);

matrix_p = zeros(np);
p0 = zeros(801);

for i = steps
disp(i)
%%
if i == 0
%% LOADING
myfilename= 'Marginal_Distribution_X_0_rank2.txt';
filename = fullfile('C:\','Users','user','Desktop','PhaseSpace','PhaseSpaceAGH','src','data',myfilename);
matrix_x=importdata(filename,' ');

myfilename= 'Marginal_Distribution_P_0_rank2.txt';
filename = fullfile('C:\','Users','user','Desktop','PhaseSpace','PhaseSpaceAGH','src','data',myfilename);
matrix_p=importdata(filename,' ');

q0(i/10+1) = max(matrix_x);
p0(i/10+1) = max(matrix_p);
maxp = max(matrix_p);
maxx = max(matrix_x);
%% PLOTTING
f = figure();

subplot(1,2,1)
plot(X, matrix_x, '-r');
hold on
xline(0, '-k');

xlim([-800,800])
ylim([0,maxx])
grid on
box on

xlabel('x [a.u.]');
ylabel('Q(x) [a.u.]');

subplot(1,2,2)
plot(P, matrix_p, '-r');

xlim([-0.5,0.5])
ylim([0,maxp])
grid on
box on

xlabel('p [a.u.]');
ylabel('P(p) [a.u.]');

titlename = {'Classical evolution. $U(x) = 0.03\exp(-x^2/500)$', 't = 0 a.u.'};
sgtitle(titlename)
%% SAVING
savename = sprintf('t000%i', i);
saveas(f,savename,'png');
close(f);
%%
elseif (i > 0) && (i <= 99)
%% LOADING
myfilename= sprintf('Marginal_Distribution_X_%i',i);
myfilename = strcat(myfilename, '_rank2.txt');
filename = fullfile('C:\','Users','user','Desktop','PhaseSpace','PhaseSpaceAGH','src','data',myfilename);
matrix_x=importdata(filename,' ');

myfilename= sprintf('Marginal_Distribution_P_%i',i);
myfilename = strcat(myfilename, '_rank2.txt');
filename = fullfile('C:\','Users','user','Desktop','PhaseSpace','PhaseSpaceAGH','src','data',myfilename);
matrix_p=importdata(filename,' ');

p0(i/10+1) = max(matrix_p);
q0(i/10 + 1) = max(matrix_x);

mp = max(matrix_p);
mx = max(matrix_x);
if mp > maxp
    maxp = mp;
end
if mx > maxx
    maxx = mx;
end
%% PLOTTING
f = figure();

subplot(1,2,1)
plot(X, matrix_x, '-r');
hold on
xline(0, '-k');

xlim([-800,800])
ylim([0,maxx])
grid on
box on

xlabel('x [a.u.]');
ylabel('Q(x) [a.u.]');

subplot(1,2,2)
plot(P, matrix_p, '-r');

xlim([-0.5,0.5])
ylim([0,maxp])
grid on
box on

xlabel('p [a.u.]');
ylabel('P(p) [a.u.]');

titlename = {'Classical evolution. $U(x) = 0.03\exp(-x^2/500)$', sprintf('~t = %i a.u.', i)};
sgtitle(titlename)
%% SAVING
savename = sprintf('t00%i', i);
saveas(f,savename,'png');
close(f)
%%
%%
elseif(i >= 100) && (i <= 999)
%% LOADING
myfilename= sprintf('Marginal_Distribution_X_%i',i);
myfilename = strcat(myfilename, '_rank2.txt');
filename = fullfile('C:\','Users','user','Desktop','PhaseSpace','PhaseSpaceAGH','src','data',myfilename);
matrix_x=importdata(filename,' ');

myfilename= sprintf('Marginal_Distribution_P_%i',i);
myfilename = strcat(myfilename, '_rank2.txt');
filename = fullfile('C:\','Users','user','Desktop','PhaseSpace','PhaseSpaceAGH','src','data',myfilename);
matrix_p=importdata(filename,' ');

p0(i/10+1) = max(matrix_p);
q0(i/10 + 1) = max(matrix_x);

mp = max(matrix_p);
mx = max(matrix_x);
if mp > maxp
    maxp = mp;
end
if mx > maxx
    maxx = mx;
end
%% PLOTTING
f = figure();

subplot(1,2,1)
plot(X, matrix_x, '-r');
hold on
xline(0, '-k');

xlim([-800,800])
ylim([0,maxx])
grid on
box on

xlabel('x [a.u.]');
ylabel('Q(x) [a.u.]');

subplot(1,2,2)
plot(P, matrix_p, '-r');

xlim([-0.5,0.5])
ylim([0,maxp])
grid on
box on

xlabel('p [a.u.]');
ylabel('P(p) [a.u.]');

titlename = {'Classical evolution. $U(x) = 0.03\exp(-x^2/500)$', sprintf('~t = %i a.u.', i)};
sgtitle(titlename)
%% SAVING
savename = sprintf('t0%i', i);
saveas(f,savename,'png');
close(f)
%%
else
%%    LOADING
myfilename= sprintf('Marginal_Distribution_X_%i',i);
myfilename = strcat(myfilename, '_rank2.txt');
filename = fullfile('C:\','Users','user','Desktop','PhaseSpace','PhaseSpaceAGH','src','data',myfilename);
matrix_x=importdata(filename,' ');

myfilename= sprintf('Marginal_Distribution_P_%i',i);
myfilename = strcat(myfilename, '_rank2.txt');
filename = fullfile('C:\','Users','user','Desktop','PhaseSpace','PhaseSpaceAGH','src','data',myfilename);
matrix_p=importdata(filename,' ');

p0(i/10+1) = max(matrix_p);
q0(i/10 + 1) = max(matrix_x);

mp = max(matrix_p);
mx = max(matrix_x);
if mp > maxp
    maxp = mp;
end
if mx > maxx
    maxx = mx;
end
%% PLOTTING
f = figure();

subplot(1,2,1)
plot(X, matrix_x, '-r');
hold on
xline(0, '-k');

xlim([-800,800])
ylim([0,maxx])
grid on
box on

xlabel('x [a.u.]');
ylabel('Q(x) [a.u.]');

subplot(1,2,2)
plot(P, matrix_p, '-r');

xlim([-0.5,0.5])
ylim([0,maxp])
grid on
box on

xlabel('p [a.u.]');
ylabel('P(p) [a.u.]');

titlename = {'Classical evolution. $U(x) = 0.03\exp(-x^2/500)$', sprintf('~t = %i a.u.', i)};
sgtitle(titlename)
%% SAVING
savename = sprintf('t%i', i);
saveas(f,savename,'png');
close(f)
end
end
