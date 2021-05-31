clc
clear

dmosAndScore=load('dmosAndScore.mat');
dmosAndScore=dmosAndScore.ans;
x0 = [50,0,0.9,0,50];
name = '1';
range = [0 5 20 100]; %标准线范围
space = 0.01;  
[LCC,RMSE,SROCC,KROCC,MAE]=relation_function(dmosAndScore,x0,name,range,space);

%disp('PCASIM');
disp(['PLCC=' sprintf('%.6f',LCC)]);    
disp(['SROCC=' sprintf('%.6f',SROCC)]);
disp(['KROCC=' sprintf('%.6f',KROCC)]);
disp(['RMSE=' sprintf('%.6f',RMSE)]);
disp(['MAE=' sprintf('%.6f',MAE)]);
%disp(['OR=' sprintf('%.4f',OR)]);