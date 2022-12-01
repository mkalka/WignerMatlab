myfilenameP = 'Marginal_Distribution_P_0_rank2.txt';
myfilenameX = 'Marginal_Distribution_X_0_rank2.txt';

Left = zeros(1,32)';
Gamma = ones(1,32)';
Right = zeros(1,32)';
Theta = zeros(1,32)';
nx = 1024;
np = 1024;
Xmin = -1500;
Xmax = 1500;
Pmin = -0.5;
Pmax = 0.5; 

X = linspace(Xmin,Xmax,nx);
P = linspace(Pmin,Pmax,np);

for i = 0:1:32
foldername = sprintf('%ipi32', i);
filenameP = fullfile('C:\','Users','user','Desktop','PhaseSpaceAGH','src','data',foldername,myfilenameP);
margP=importdata(filenameP,' ');
filenameX = fullfile('C:\','Users','user','Desktop','PhaseSpaceAGH','src','data',foldername,myfilenameX);
margX=importdata(filenameX,' ');
margP_array(:,i+1) = margP;
margX_array(:,i+1) = margX;
Gamma(i+1) = 1;
Theta(i+1) = (i*pi)/32;
Left(i+1) = trapz(margP(1:512),flip(p(1:512)));
Right(i+1) = trapz(margP(513:1024),flip(p(513:1024)));
end

T=table(Theta, Left, Right);