%Efstathios Dimitriadis 8490
%Emmanouil Mylonas 9508

Group24Exe1Prog3
Group24Exe5Prog1 %Simple Regression 
clc
%% UK
name = 'UK';
[model_UK, R_adj_UK] = Group24Exe6Fun1(total_cases_uk,total_deaths_uk,50,210,adjR2_simple(1),name);


%% Austria

name = 'Austria';
[model_Austria, R_adj_Au] = Group24Exe6Fun1(total_cases_au,total_deaths_au,50,150,adjR2_simple(2),name);

%% Belgium

name = 'Belgium';
[model_Bel, R_adj_Bel] = Group24Exe6Fun1(total_cases_bel,total_deaths_bel,60,170,adjR2_simple(3),name);

%% France

name = 'France';
[model_Fr, R_adj_Fr] = Group24Exe6Fun1(total_cases_fr,total_deaths_fr,58,150,adjR2_simple(4),name);

%% Greece

name = 'Greece';
[model_Gr, R_adj_Gr] = Group24Exe6Fun1(total_cases_gr,total_deaths_gr,58,150,adjR2_simple(5),name);


%% Ireland 

name = 'Ireland';
[model_Ir, R_adj_Ir] = Group24Exe6Fun1(total_cases_ir,total_deaths_ir,59,184,adjR2_simple(6),name);


% For all countries we detect a big improvement by using the standard
% multiple regression model instead of simple regression. For some
% countries like Belgium we went from a ~0.78 adjusted R squared to
% ~0.97 and even countries like Greece which had a really low adjusted R 
% square (~0.29) for simple regression saw a big improvement (~0.43). Of 
% course the fitting model for some countries remains poor but still it is improved.
% For most countries, stepwise regression was really close and the
% difference in the magnitude of the second decimal. For this project we
% deciced to continue working with the full model because even though it is
% more complex and computationally expensive we didn't encounter any
% performance problems since the volume of the data is small.
