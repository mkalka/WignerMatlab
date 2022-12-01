time = 0:0.1:5; %seconds
A = 500; %number of plots
colormap(cool(A))
jetcustom = cool(A);
figure
for H = 1:A
plot(time,(H/100)*sin(time),  'Color',  jetcustom((H),:))
hold on
end
xlabel('Time (s)')
ylabel ('Y(t)')
colormap(cool(A))
cb = colorbar;
caxis([0 5])
ylabel(cb,'Amplitude')