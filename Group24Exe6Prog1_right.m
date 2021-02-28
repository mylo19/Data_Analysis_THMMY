%Efstathios Dimitriadis 8490
%Emmanouil Mylonas 9508

Group24Exe1Prog3

Group24Exe5Prog1 %Simple Regression 

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


%For some reason, in all 6 countries the best model is the full 21-%variable
%Maybe that doesn't make sense, we should check it.
