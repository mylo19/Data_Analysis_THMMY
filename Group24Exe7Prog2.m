%Efstathios Dimitriadis 8490
%Emmanouil Mylonas 9508
%Predict 2nd wave using models from assignment 6

Group24Exe1Prog3
Group24Exe7Prog1
Group24Exe6Prog1_right
close all

%% UK
name = 'UK';
Group24Exe7Fun1(model_UK, total_cases_uk, total_deaths_uk, start_cases_second_uk, end_cases_second_uk, name);

%% Austria
name = 'Austria';
Group24Exe7Fun1(model_Austria, total_cases_au, total_deaths_au, start_second_au, end_second_au, name);

%% Belgium
name = 'Belgium';
Group24Exe7Fun1(model_Bel, total_cases_bel, total_deaths_bel, start_second_be, end_second_be, name);

%% France
name = 'France';
Group24Exe7Fun1(model_Fr, total_cases_fr, total_deaths_fr, start_second_fr, end_second_fr, name);

%% Greece
name = 'Greece';
Group24Exe7Fun1(model_Gr, total_cases_gr, total_deaths_gr, start_second_gr, end_second_gr, name);

%% Ireland 
name = 'Ireland';
Group24Exe7Fun1(model_Ir, total_cases_ir, total_deaths_ir, start_second_ir, end_second_ir, name);
