%%Efstathios Dimitriadis 8490
%Emmanouil Mylonas 9508
%For this Executive we use the LASSO model, implemented in Group24Exe8Fun1.

Group24Exe1Prog3 %1st wave definition
Group24Exe7Prog1 %2nd wave definition

adjR2_training = zeros(6,1);
adjR2_prediction = zeros(6,1);

%% UK

%training our model with the first wave
[bLASSO,k,adjR2_training(1)] = Group24Exe8Fun1(total_cases_uk,total_deaths_uk,50,210);

%prediction with the second wave
adjR2_prediction(1) = Group24Exe8Fun2(total_cases_uk,total_deaths_uk,start_second_uk,...
    end_second_uk, bLASSO, k);

%% Austria

%training our model with the first wave
[bLASSO,k,adjR2_training(2)] = Group24Exe8Fun1(total_cases_au,total_deaths_au,50,150);

%prediction with the second wave
adjR2_prediction(2) = Group24Exe8Fun2(total_cases_au,total_deaths_au,start_second_au,...
    end_second_au, bLASSO, k);

%% Belgium

%training our model with the first wave
[bLASSO,k,adjR2_training(3)] = Group24Exe8Fun1(total_cases_bel,total_deaths_bel,60,170);

%prediction with the second wave
adjR2_prediction(3) = Group24Exe8Fun2(total_cases_bel,total_deaths_bel,start_second_be,...
    end_second_be, bLASSO, k);
%% France

%training our model with the first wave
[bLASSO,k,adjR2_training(4)] = Group24Exe8Fun1(total_cases_fr,total_deaths_fr,58,150);

%prediction with the second wave
adjR2_prediction(4) = Group24Exe8Fun2(total_cases_fr,total_deaths_fr,start_second_fr,...
    end_second_fr, bLASSO, k);

%% Greece 

%training our model with the first wave
[bLASSO,k,adjR2_training(5)] = Group24Exe8Fun1(total_cases_gr,total_deaths_gr,58,150);

%prediction with the second wave
adjR2_prediction(5) = Group24Exe8Fun2(total_cases_gr,total_deaths_gr,start_second_gr,...
    end_second_gr, bLASSO, k);

%% Ireland

%training our model with the first wave
[bLASSO,k,adjR2_training(6)] = Group24Exe8Fun1(total_cases_ir,total_deaths_ir,59,184);

%prediction with the second wave
adjR2_prediction(6) = Group24Exe8Fun2(total_cases_ir,total_deaths_ir,start_second_ir,...
    end_second_ir, bLASSO, k);

%% RESULTS

disp('The adjusted R square for the training model is:')
disp(adjR2_training)
%Here some countries have a relatively small adjR2, which means that LASSO
%didn't return the optimised results. Surely, the model used in Executive 6
%and 7 returns better results, as explained in Executive 7.

disp('The adjusted R square for the prediction model is:')
disp(adjR2_prediction)

% We can observe that even after the normalisation in the second wave, our
% model doesn't seem to fit well in the second wave, even with the use of
% LASSO instead of the full 21-model that was used in Executive 7. The
% answer for this is really simple. The first wave had a way bigger death
% rate next to the second wave, since COVID-19 was a new deseace that
% people could not deal yet. Since then the death rate has dropped
% significantly, making the predictions for the deaths using the model
% trained in the first wave useless. For example, if we plot the cases and
% the deaths in Ireland, we can easily understand that there is a huge
% diversion among these, and hence we cannot take trustworthy results.
% Ireland has the worst Adjuster R square from all of our countries, since
% it has the biggest diversion.

% If we wanted more reliable results, we could probably train the model in
% the data from the second wave and use it in the third wave, which starts
% now all around the world, but is already at the same levels with the
% second wave, and not as unique as the first one. 
