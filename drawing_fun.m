set(0,'defaultTextInterpreter','latex');
set(0,'DefaultLineLineWidth', 1.5); 
set(0,'defaultAxesTickLabelInterpreter','latex');
set(0,'defaultColorBarTickLabelInterpreter','latex');
set(0,'defaultAxesFontSize',30);
set(0,'defaultAxesFontName', 'TeX Gyre Schola Math');

A = size(entropy_array,1);
steps = [10:10:8000];
jetcustom = hsv(A);
figure
for i = 1:A
  plot(steps, entropy_array(i, :),  'Color',  jetcustom((i),:))
  hold on
end
yline(entropy_array(1,1), '--k');
yline(entropy_array(2,700), '--k');
yline(entropy_array(3,700), '--k');
yline(entropy_array(4,700), '--k');
yline(entropy_array(5,700), '--k');
yline(entropy_array(6,700), '--k');
title("Entropy")
axis('auto');
grid on
box on
xlabel('t [a.u.]');
ylabel('S[$\rho$]');
%'\Gamma = 0',
colormap(hsv(A));
cb = colorbar('XTick', [0 0.004 0.008 0.012 0.016 0.020],...
    'XTickLabel', {'0', '0.004', '0.008', '0.012', '0.016', '0.020'});
caxis([0 0.020]);
ylabel(cb,'$U_0$');
cb.Label.Interpreter = 'latex';