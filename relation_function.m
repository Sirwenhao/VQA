function [LCC,RMSE,SROCC,KROCC,MAE]=relation_function(DmosAndScores,x0,~,~,~)
global DMOS;
global Scores;
DMOS = DmosAndScores(:,1);
Scores = DmosAndScores(:,2);


options = optimset('GradObj','on','Display','off');
coeffs = fminunc(@fitting,x0,options); 

I=ones(size(Scores));
QScores = coeffs(1).*logistic(coeffs(2).*I, Scores-coeffs(3).*I) + coeffs(4).*Scores + coeffs(5).*I;



LCC = corr(DMOS,QScores,'type','Pearson');
RMSE = ((1/size(DMOS,1))*((DMOS-QScores)'*(DMOS-QScores)))^(1/2);
SROCC = corr(DMOS,QScores,'type','Spearman');
KROCC = corr(DMOS,QScores,'type','Kendall');
MAE = (1/size(DMOS,1)) * sum (abs(DMOS-QScores));

