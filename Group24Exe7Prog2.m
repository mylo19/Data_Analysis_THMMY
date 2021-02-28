%Efstathios Dimitriadis 8490
%Emmanouil Mylonas 9508
%Predict 2nd wave using models from assignment 6

Group24Exe6Prog1
Group24Exe7Prog1
close all
clc

%% UK
name = 'UK';
fprintf('The coefficient of determination for %s training dataset was %.4f\n',name, R_adj_UK)
Group24Exe7Fun1(model_UK, total_cases_uk, total_deaths_uk, start_second_uk, end_second_uk, name);

%% Austria
name = 'Austria';
fprintf('The coefficient of determination for %s training dataset was %.4f\n',name, R_adj_Au)
Group24Exe7Fun1(model_Austria, total_cases_au, total_deaths_au, start_second_au, end_second_au, name);

%% Belgium
name = 'Belgium';
fprintf('The coefficient of determination for %s training dataset was %.4f\n',name, R_adj_Bel)
Group24Exe7Fun1(model_Bel, total_cases_bel, total_deaths_bel, start_second_be, end_second_be, name);

%% France
name = 'France';
fprintf('The coefficient of determination for %s training dataset was %.4f\n',name, R_adj_Fr)
Group24Exe7Fun1(model_Fr, total_cases_fr, total_deaths_fr, start_second_fr, end_second_fr, name);

%% Greece
name = 'Greece';
fprintf('The coefficient of determination for %s training dataset was %.4f\n',name, R_adj_Gr)
Group24Exe7Fun1(model_Gr, total_cases_gr, total_deaths_gr, start_second_gr, end_second_gr, name);

%% Ireland 
name = 'Ireland';
fprintf('The coefficient of determination for %s training dataset was %.4f\n',name, R_adj_Ir)
Group24Exe7Fun1(model_Ir, total_cases_ir, total_deaths_ir, start_second_ir, end_second_ir, name);

% We notice that the model is inadequate for the second wave and even
% countries like Belgium which had a very high adjusted R square were in
% fact overfitting to the training dataset.