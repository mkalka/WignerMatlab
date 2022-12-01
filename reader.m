clc;
clear;

A1 = importdata('DSC_gaussianBarrier_rank2_4000.txt',' ');
A2 = importdata('DSC_gaussianBarrier_rank2_4500.txt',' ');
A3 = importdata('DSC_gaussianBarrier_rank2_5000.txt',' ');
A4 = importdata('DSC_gaussianBarrier_rank2_5500.txt',' ');
A5 = importdata('DSC_gaussianBarrier_rank2_6000.txt',' ');
A6 = importdata('DSC_gaussianBarrier_rank2_6500.txt',' ');
nx = 1024;
np = 1024;
Xmin = -800;
Xmax = 800;
Pmin = -0.5;
Pmax = 0.5; 

X = linspace(Xmin,Xmax,nx);
P = linspace(Pmin,Pmax,np);

[x,p] = meshgrid(X,P);

m = [max(max(A1)) max(max(A2)) max(max(A3)) max(max(A4)) max(max(A5)) max(max(A6))];
M = min(m);

f = figure();
subplot(2,3,1)
surf(x,p,A1','EdgeColor','none');
view(0,90);
axis('square');
grid on
ax = gca;
ax.GridAlpha = 1;
alpha(0.9);
title('t = 4000 au')

colormap(redblue)
colorbar
caxis([-M M]);
xlabel('x [au]');
ylabel('p [au]');


subplot(2,3,2)
surf(x,p,A2','EdgeColor','none');
view(0,90);
axis('square');
grid on
ax = gca;
ax.GridAlpha = 1;
alpha(0.9);
title('t = 4500 au')

colormap(redblue)
colorbar
caxis([-M M]);
xlabel('x [au]');
ylabel('p [au]');

subplot(2,3,3)
surf(x,p,A3','EdgeColor','none');
view(0,90);
axis('square');
grid on
ax = gca;
ax.GridAlpha = 1;
alpha(0.9);
title('t = 5000 au')
colormap(redblue)
colorbar
caxis([-M M]);
xlabel('x [au]');
ylabel('p [au]');

subplot(2,3,4)
surf(x,p,A4','EdgeColor','none');
view(0,90);
axis('square');
grid on
ax = gca;
ax.GridAlpha = 1;
alpha(0.9);
title('t = 5500 au')

colormap(redblue)
colorbar
caxis([-M M]);
xlabel('x [au]');
ylabel('p [au]');

subplot(2,3,5)
surf(x,p,A5','EdgeColor','none');
view(0,90);
axis('square');
grid on
ax = gca;
ax.GridAlpha = 1;
alpha(0.9);
title('t = 6000 au')

colormap(redblue)
colorbar
caxis([-M M]);
xlabel('x [au]');
ylabel('p [au]');

subplot(2,3,6)
surf(x,p,A6','EdgeColor','none');
view(0,90);
axis('square');
grid on;
ax = gca;
ax.GridAlpha = 1;
title('t = 6500 au')
alpha(0.9);

colormap(redblue)
colorbar
caxis([-M M]);
xlabel('x [au]');
ylabel('p [au]');

sgtitle({'Gaussian Barrier: U(x) = U_0*exp(-(x-x_b)^2/2w^2); x_b = 0, U_0 = 0.008, w^2 = 50' 'Initial DSC: x1 = -300 p1 = 0.15; x2 = 300 p2 = -0.15; delta = sqrt(500); gamma = 0'})

