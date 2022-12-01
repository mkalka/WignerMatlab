clear;
clc;
Nt=102;
nx=512;
np=nx;

tab = zeros(nx,np,Nt);
for r=1:Nt
myfilename= sprintf('free_particle_%i.txt',r-1);
filename = fullfile('C:\','Users','Konto1','Desktop','NewFolder','PhaseSpaceAGH','data',myfilename);
tab(:,:,r)=importdata(filename,' ');
end