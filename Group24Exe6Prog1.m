%Efstathios Dimitriadis 8490
%Emmanouil Mylonas 9508

Group24Exe1Prog3


%% United Kingdom
[simpleRegUk, multipleRegUk] = Group24Exe6Fun1(normalised_cases_uk, total_deaths_uk, 50, 210);

%% Austria
[simpe_reg_au, multi_req_au] = Group24Exe6Fun1(normalised_cases_austria, total_deaths_au, 50, 150);

%% Belgium
[simple_reg_be, multi_req_be] = Group24Exe6Fun1(normalised_cases_belgium, total_deaths_bel, 60, 170);

%% France
[simpe_reg_fr, multi_req_fr] = Group24Exe6Fun1(normalised_cases_france, total_deaths_fr, 58, 150);

%% Greece
% We have a problem for T=19 for stepwise regression
% [simpe_reg_gr, multi_req_gr] = Group24Exe6Fun1(normalised_cases_greece, total_deaths_gr, 58, 150);

%% Ireland
[simpe_reg_ir, multi_req_ir] = Group24Exe6Fun1(normalised_cases_ireland, total_deaths_ir, 59, 184);

%need to reach conclusion, other than
%that it is ready.
