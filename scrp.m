amplitudeX = 800;
amplitudeP = 0.2;
nx = 1024;
np= 1024;
x_vector = linspace(-abs(amplitudeX), abs(amplitudeX*(1-2/nx)), nx);
p_vector = linspace(-abs(amplitudeP), abs(amplitudeP*(1-2/np)), np);

fir = importdata("DSC_gaussianBarrier_rank2_0.txt",' ');
sec = importdata("DSC_gaussianBarrier_rank2_1.txt", ' ');
thi = importdata("DSC_gaussianBarrier_rank2_10.txt", ' ');
fou = importdata("DSC_gaussianBarrier_rank2_100.txt", ' ');
fif = importdata("DSC_gaussianBarrier_rank2_200.txt", ' ');
six = importdata("DSC_gaussianBarrier_rank2_300.txt", ' ');
sev = importdata("DSC_gaussianBarrier_rank2_400.txt", ' ');
eig = importdata("DSC_gaussianBarrier_rank2_500.txt", ' ');
nin = importdata("DSC_gaussianBarrier_rank2_500.txt", ' ');

figure

subplot(3,3,1)
contourf(x_vector, p_vector,fir','EdgeColor', 'none')
axis('auto')
title('t=0 au = 0 fs')
colorbar

subplot(3,3,2)
contourf(x_vector, p_vector,sec,'EdgeColor', 'none')
axis('auto')
title('t=0.01 au = 0.00024 fs')
colorbar

subplot(3,3,3)
contourf(x_vector, p_vector,thi,'EdgeColor', 'none')
axis('auto')
title('t=0.1 au = 0.0024 fs')
colorbar

subplot(3,3,4)
contourf(x_vector, p_vector,fou,'EdgeColor', 'none')
axis('auto')
title('t=1 au = 0.024 fs')
colorbar

subplot(3,3,5)
contourf(x_vector, p_vector,fif,'EdgeColor', 'none')
axis('auto')
title('t=5 au = 0.121 fs')
colorbar

subplot(3,3,6)
contourf(x_vector, p_vector,six,'EdgeColor', 'none')
axis('auto')
title('t=10 au = 0.242 fs')
colorbar

subplot(3,3,7)
contourf(x_vector, p_vector,sev,'EdgeColor', 'none')
axis('auto')
title('t=25 au = 0.605 fs')
colorbar

subplot(3,3,8)
contourf(x_vector, p_vector,eig,'EdgeColor', 'none')
axis('auto')
title('t=50 au = 1.209 fs')
colorbar

subplot(3,3,9)
contourf(x_vector, p_vector,nin,'EdgeColor', 'none')
axis('auto')
title('t=75 au = 1.814 fs')
colorbar

colormap(redblue)

sgtitle({'dt = 0.01, nx = 512, np = 512, ampX = 20 ampP = 25' 'U(x) = -0.5x^2 + 0.08x^4',' initial gaussian x0 = -3.5 au, p0 = -3.5 a.u, dev_x = dev_p = sqrt(2)/2'})

h=findobj(gcf,'type','axes');
set([h.XLabel],'string','x [au]');
set([h.YLabel],'string', 'p [au]');