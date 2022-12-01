np = 1024;

Pmin = -0.5;
Pmax = 0.5; 

p = [-Pmax:2*Pmax/np:Pmax-2*Pmax/np];
i = 13;

myfilenameP = 'Marginal_Distribution_P_7000_rank2.txt';
foldername = 'W500';
filenameP = fullfile('C:\','Users','user','Desktop','THETA 0 VARY PARAMS',foldername,myfilenameP);
margP=importdata(filenameP,' ');

margP_array(:,i) = margP;
U0(i) = .008;
w2(i) = 500;
Left(i) = trapz(margP(1:512),flip(p(1:512)));
Right(i) = trapz(margP(513:1024),flip(p(513:1024)));

%T=table(U0,w2, Left, Right);