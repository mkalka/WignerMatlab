clc;
clear;

%% Plotting settings
set(0,'defaulttextinterpreter','latex');
set(0,'DefaultLineLineWidth', 1.25); 
set(0, 'defaultAxesTickLabelInterpreter','latex');
set(0,'defaultAxesFontSize',20);
set(0,'defaultAxesFontName', 'TeX Gyre Schola Math');
set(0,'defaultColorBarFontName', 'TeX Gyre Schola Math');
set(0, 'defaultColorBarTickLabelInterpreter','latex');

%% Parameters in atomic units
sizeX = 512.0; %siatka X
sizeP = 512.0; %siatka P
dt = 0.01; %krok czasowy
timeStepsN = 1; %siatka t
mass = 1; %masa
maxX =256.0; %amplituda X
maxP = 256.0; %amplituda P
hbar = 1; %hbar
potStr = 0.1; %parametr potencja³u x^4

dX = 2*maxX./sizeX; %do normalizacji
dP = 2*maxP./sizeP; %do normalizacji

sX = 20; %rozmycie gaussian x
sP = 20; %rozmycie gaussian p

%% Defining potential
Potential = @(x) 0;%@(x)-0.5*x.^2 + 0.25.*potStr.*x.^4; %potencjal x^4 z publikacji arXiv:1212.3406v1
%Potential = @(x) 20.*(1-exp(-0.16.*x));

%% Defining vectors containing respective range of values
x_vector = linspace(-abs(maxX), abs(maxX.*(1 - 2./sizeX)), sizeX);
p_vector = linspace(-abs(maxP), abs(maxP.*(1 - 2./sizeP)), sizeP);

theta_vector = fftshift(2.*pi*fftfreq(length(p_vector), p_vector(2) - p_vector(1)));
lambda_vector = fftshift(2.*pi*fftfreq(length(x_vector), x_vector(2) - x_vector(1)));

%pH_vector = (sqrt(2./potStr)).*sech(asech(((sqrt(potStr./2)).*x_vector))).*tanh(asech(((sqrt(potStr./2)).*x_vector)));

%% Defining [Theta, X] and [P, Lambda] mesh grids
[Theta, X] = meshgrid(theta_vector, x_vector);
[P, Lambda] = meshgrid(p_vector, lambda_vector);

%% Specyfying the initial state
W_init = (1/2/pi/sX/sP)*exp(-0.5*((X).^2/sX^2 + (P).^2/sP^2)); %gaussowski pakiet pocz¹tkowy 

%norm_init = sum(sum(W_init))*dP*dX; %norma -> czy trzeba normalizowaæ?
%W_init = W_init./norm_init; %normalizacja

%% Defining the propagartor factors
potentialPropagatorFactor = ifftshift(exp(1i.*dt.*(Potential(X-(hbar.*Theta)./2) - Potential(X + (hbar.*Theta)./2))), 2);
kineticPropagarorFactor = ifftshift(exp(1i.*dt.*(Lambda.*P)./mass), 1);

%% Propagation
W = W_init;

figure
hold on
for i=1:timeStepsN
%% Split operator method
B = fft(W, length(W), 2);
B = B.*potentialPropagatorFactor;

Z = fft(B, length(B), 1);
A = ifft(Z, length(Z), 2);
A = A.*kineticPropagarorFactor;

W = ifft(A, length(A), 1);
end
W_final = real(W);

disp(i)
[M, c] = contourf(x_vector, p_vector, W_final);
colormap('cool')
c.LineColor = 'none';
colorbar;
xlabel('X [a.u.]'); % x-axis label
ylabel('P [a.u.]'); % y-axis label

%}

