%Efstathios Dimitriadis 8490
%Emmanouil Mylonas 9508

Group24Exe1Prog3

%% United Kingdom

adjR2 = zeros(21,1);
rmse = zeros(length(normalised_cases_uk),21);
y = zeros(length(normalised_cases_uk),21);
b = zeros(2,21);
adjR2_simple = zeros(6,1);

for t=0:20
    deaths_sample = total_deaths_uk(50+t:210+t)/sum(total_deaths_uk(50+t:210+t)); 
    cases_sample = [ones(size(normalised_cases_uk')) normalised_cases_uk'];
    b(:,t+1) = regress(deaths_sample', cases_sample);
    n = length(deaths_sample);
    y(:,t+1) = cases_sample*b(:,t+1);
    adjR2(t+1) = 1 - (n-1)*sum((deaths_sample'-y(:,t+1)).^2)/((n-2)*sum((deaths_sample-mean(deaths_sample)).^2));
    se2 = sum((deaths_sample'-y(:,t+1)).^2)/(n-2);
    rmse(:,t+1) = (deaths_sample'-y(:,t+1))/sqrt(se2);
end

[~,i] = max(adjR2);
figure()
scatter(y(:,i),rmse(:,i+1))
hold on
plot(xlim,-1.96*[1 1],'--c')
plot(xlim,1.96*[1 1],'--c')
title('Simple Regression - Diagnostic Plot for UK')

fprintf('Simple Regression - The best delay for UK is %.0f days\n',i-1);
fprintf('Simple Regression - The best model for UK is y = (%f) * x + (%f)\n',b(2,i),b(1,i))

adjR2_simple(1) = adjR2(i);
%% Austria

adjR2 = zeros(21,1);
rmse = zeros(length(normalised_cases_austria),21);
y = zeros(length(normalised_cases_austria),21);
b = zeros(2,21);
for t=0:20
    deaths_sample = total_deaths_au(50+t:150+t)/sum(total_deaths_au(50+t:150+t));
    cases_sample = [ones(size(normalised_cases_austria')) normalised_cases_austria'];
    b(:,t+1) = regress(deaths_sample', cases_sample);
    n = length(deaths_sample);
    y(:,t+1) = cases_sample*b(:,t+1);
    adjR2(t+1) = 1 - (n-1)*sum((deaths_sample'-y(:,t+1)).^2)/((n-2)*sum((deaths_sample-mean(deaths_sample)).^2));
    se2 = sum((deaths_sample'-y(:,t+1)).^2/(n-2));
    rmse(:,t+1) = (deaths_sample'-y(:,t+1))/sqrt(se2);
end

[~,i] = max(adjR2);
figure()
scatter(y(:,i),rmse(:,i+1))
hold on
plot(xlim,-1.96*[1 1],'--c')
plot(xlim,1.96*[1 1],'--c')
title('Simple Regression - Diagnostic Plot for Austria')

fprintf('Simple Regression - The best delay for Austria is %.0f days\n',i-1);
fprintf('Simple Regression - The best model for Austria is y = (%f) * x + (%f)\n',b(2,i),b(1,i))

adjR2_simple(2) = adjR2(i);
%% Belgium


adjR2 = zeros(21,1);
rmse = zeros(length(normalised_cases_belgium),21);
y = zeros(length(normalised_cases_belgium),21);
b = zeros(2,21);
for t=0:20
    deaths_sample = total_deaths_bel(60+t:170+t)/sum(total_deaths_bel(60+t:170+t));
    cases_sample = [ones(size(normalised_cases_belgium')) normalised_cases_belgium'];
    b(:,t+1) = regress(deaths_sample', cases_sample);
    n = length(deaths_sample);
    y(:,t+1) = cases_sample*b(:,t+1);
    adjR2(t+1) = 1 - (n-1)*sum((deaths_sample'-y(:,t+1)).^2)/((n-2)*sum((deaths_sample-mean(deaths_sample)).^2));
    se2 = sum((deaths_sample'-y(:,t+1)).^2/(n-2));
    rmse(:,t+1) = (deaths_sample'-y(:,t+1))/sqrt(se2);
end

[~,i] = max(adjR2);
figure()
scatter(y(:,i),rmse(:,i+1))
hold on
plot(xlim,-1.96*[1 1],'--c')
plot(xlim,1.96*[1 1],'--c')
title('Simple Regression - Diagnostic Plot for Belgium')

fprintf('Simple Regression - The best delay for Belgium is %.0f days\n',i-1);
fprintf('Simple Regression - The best model for Belgium is y = (%f) * x + (%f)\n',b(2,i),b(1,i))

adjR2_simple(3) = adjR2(i);

%% France

adjR2 = zeros(21,1);
rmse = zeros(length(normalised_cases_france),21);
y = zeros(length(normalised_cases_france),21);
b = zeros(2,21);
for t=0:20
    deaths_sample = total_deaths_fr(58+t:150+t)/sum(total_deaths_fr(58+t:150+t));
    cases_sample = [ones(size(normalised_cases_france')) normalised_cases_france'];
    b(:,t+1) = regress(deaths_sample', cases_sample);
    n = length(deaths_sample);
    y(:,t+1) = cases_sample*b(:,t+1);
    adjR2(t+1) = 1 - (n-1)*sum((deaths_sample'-y(:,t+1)).^2)/((n-2)*sum((deaths_sample-mean(deaths_sample)).^2));
    se2 = sum((deaths_sample'-y(:,t+1)).^2/(n-2));
    rmse(:,t+1) = (deaths_sample'-y(:,t+1))/sqrt(se2);
end

[~,i] = max(adjR2);
figure()
scatter(y(:,i),rmse(:,i+1))
hold on
plot(xlim,-1.96*[1 1],'--c')
plot(xlim,1.96*[1 1],'--c')
title('Simple Regression - Diagnostic Plot for France')

fprintf('Simple Regression - The best delay for France is %.0f days\n',i-1);
fprintf('Simple Regression - The best model for France is y = (%f) * x + (%f)\n',b(2,i),b(1,i))

adjR2_simple(4) = adjR2(i);

%% Greece

adjR2 = zeros(21,1);
rmse = zeros(length(normalised_cases_greece),21);
y = zeros(length(normalised_cases_greece),21);
b = zeros(2,21);
for t=0:20
    deaths_sample = total_deaths_gr(58+t:150+t)/sum(total_deaths_gr(58+t:150+t));
    cases_sample = [ones(size(normalised_cases_greece')) normalised_cases_greece'];
    b(:,t+1) = regress(deaths_sample', cases_sample);
    n = length(deaths_sample);
    y(:,t+1) = cases_sample*b(:,t+1);
    adjR2(t+1) = 1 - (n-1)*sum((deaths_sample'-y(:,t+1)).^2)/((n-2)*sum((deaths_sample-mean(deaths_sample)).^2));
    se2 = sum((deaths_sample'-y(:,t+1)).^2/(n-2));
    rmse(:,t+1) = (deaths_sample'-y(:,t+1))/sqrt(se2);
end

[~,i] = max(adjR2);
figure()
scatter(y(:,i),rmse(:,i+1))
hold on
plot(xlim,-1.96*[1 1],'--c')
plot(xlim,1.96*[1 1],'--c')
title('Simple Regression - Diagnostic Plot for Greece')

fprintf('Simple Regression - The best delay for Greece is %.0f days\n',i-1);
fprintf('Simple Regression - The best model for Greece is y = (%f) * x + (%f)\n',b(2,i),b(1,i))

adjR2_simple(5) = adjR2(i);

%% Ireland

adjR2 = zeros(21,1);
rmse = zeros(length(normalised_cases_ireland),21);
y = zeros(length(normalised_cases_ireland),21);
b = zeros(2,21);
for t=0:20
    deaths_sample = total_deaths_ir(59+t:184+t)/sum(total_deaths_ir(59+t:184+t));
    cases_sample = [ones(size(normalised_cases_ireland')) normalised_cases_ireland'];
    b(:,t+1) = regress(deaths_sample', cases_sample);
    n = length(deaths_sample);
    y(:,t+1) = cases_sample*b(:,t+1);
    adjR2(t+1) = 1 - (n-1)*sum((deaths_sample'-y(:,t+1)).^2)/((n-2)*sum((deaths_sample-mean(deaths_sample)).^2));
    se2 = sum((deaths_sample'-y(:,t+1)).^2/(n-2));
    rmse(:,t+1) = (deaths_sample'-y(:,t+1))/sqrt(se2);
end

[~,i] = max(adjR2);
figure()
scatter(y(:,i),rmse(:,i+1))
hold on
plot(xlim,-1.96*[1 1],'--c')
plot(xlim,1.96*[1 1],'--c')
title('Simple Regression - Diagnostic Plot for Ireland')

fprintf('Simple Regression - The best delay for Ireland is %.0f days\n',i-1);
fprintf('Simple Regression - The best model for Ireland is y = (%f) * x + (%f)\n',b(2,i),b(1,i))

adjR2_simple(6) = adjR2(i);

% By examing the adjusted R squared and the Diagnostic Plots we can observe
% that out of the six Countries only two(UK and Belgium) have an efficient
% simple linear regression model. For the rest we have either an average
% fitting (France) or display inadequate results.
% After examing the Diagnostic Plots in detail we notice that in Ireland
% and France we encounter some outliers, for Austria a respectable portion 
% of the samples lies out the bounds and for Greece it is clear that we 
% have a different type of correlation.

%We can observe that the results are in accordance with Executive 4! In
%each country the best fitting model is the one with the exact number of
%delays between deaths and cases as in Program 4. That makes a lot of sense
%since as we saw, the Pearson's coefficient factor is related to the
%linear regression. 
%On the other hand Executive 5, same as 4 is not alligned with the resluts
%presented in Executive 3. As we mentioned before, we can see that the two
%waves progress with some relation, however, the day with the most
%cases/deaths is not a reliable statistic factor.