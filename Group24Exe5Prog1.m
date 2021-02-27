%Efstathios Dimitriadis 8490
%Emmanouil Mylonas 9508

Group24Exe1Prog3

%% United Kingdom

adjR2 = zeros(21,1);
e_standard = zeros(length(normalised_cases_uk),21);
y = zeros(length(normalised_cases_uk),21);
b = zeros(2,21);

for t=0:20
    deaths_sample = total_deaths_uk(50+t:210+t)/sum(total_deaths_uk(50+t:210+t)); 
    cases_sample = [ones(size(normalised_cases_uk')) normalised_cases_uk'];
    b(:,t+1) = regress(deaths_sample', cases_sample);
    n = length(deaths_sample);
    y(:,t+1) = cases_sample*b(:,t+1);
    adjR2(t+1) = 1 - (n-1)*sum((deaths_sample'-y(:,t+1)).^2)/((n-2)*sum((deaths_sample-mean(deaths_sample)).^2));
    se2 = sum((deaths_sample'-y(:,t+1)).^2/(n-2));
    e_standard(:,t+1) = (deaths_sample'-y(:,t+1))/sqrt(se2);
end

[~,i] = max(adjR2);
figure()
scatter(y(:,i+1),e_standard(:,i+1))
hold on
plot(xlim,-1.96*[1 1],'--c')
plot(xlim,1.96*[1 1],'--c')
title('Diagnostic Plot for UK')

fprintf('The best delay for UK is %.0f days\n',i);
fprintf('The best model for UK is y = (%f) * x + (%f)\n',b(2,i+1),b(1,i+1))

%We can observe that the results are in accordance with Program 4. In both,
%the best delay for the deaths is 0 days!

%% Austria

adjR2 = zeros(21,1);
e_standard = zeros(length(normalised_cases_austria),21);
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
    e_standard(:,t+1) = (deaths_sample'-y(:,t+1))/sqrt(se2);
end

[~,i] = max(adjR2);
figure()
scatter(y(:,i+1),e_standard(:,i+1))
hold on
plot(xlim,-1.96*[1 1],'--c')
plot(xlim,1.96*[1 1],'--c')
title('Diagnostic Plot for Austria')

fprintf('The best delay for Austria is %.0f days\n',i);
fprintf('The best model for Austria is y = (%f) * x + (%f)\n',b(2,i+1),b(1,i+1))

%Austria's model here is really close to what was created in Program 4,
%with only one day seperation, 13 here, 12 in program 4.

%% Belgium

adjR2 = zeros(21,1);
e_standard = zeros(length(normalised_cases_belgium),21);
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
    e_standard(:,t+1) = (deaths_sample'-y(:,t+1))/sqrt(se2);
end

[~,i] = max(adjR2);
figure()
scatter(y(:,i+1),e_standard(:,i+1))
hold on
plot(xlim,-1.96*[1 1],'--c')
plot(xlim,1.96*[1 1],'--c')
title('Diagnostic Plot for Belgium')

fprintf('The best delay for Belgium is %.0f days\n',i);
fprintf('The best model for Belgium is y = (%f) * x + (%f)\n',b(2,i+1),b(1,i+1))

%Same as Austria, we only have one day difference from the two results in 4
%and 5, here Belgium has 6 days delay, while in the previous program 5.


%% France

adjR2 = zeros(21,1);
e_standard = zeros(length(normalised_cases_france),21);
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
    e_standard(:,t+1) = (deaths_sample'-y(:,t+1))/sqrt(se2);
end

[~,i] = max(adjR2);
figure()
scatter(y(:,i+1),e_standard(:,i+1))
hold on
plot(xlim,-1.96*[1 1],'--c')
plot(xlim,1.96*[1 1],'--c')
title('Diagnostic Plot for France')

fprintf('The best delay for France is %.0f days\n',i);
fprintf('The best model for France is y = (%f) * x + (%f)\n',b(2,i+1),b(1,i+1))

%Again 1 day difference.

%% Greece

adjR2 = zeros(21,1);
e_standard = zeros(length(normalised_cases_greece),21);
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
    e_standard(:,t+1) = (deaths_sample'-y(:,t+1))/sqrt(se2);
end

[~,i] = max(adjR2);
figure()
scatter(y(:,i+1),e_standard(:,i+1))
hold on
plot(xlim,-1.96*[1 1],'--c')
plot(xlim,1.96*[1 1],'--c')
title('Diagnostic Plot for Greece')

fprintf('The best delay for Greece is %.0f days\n',i);
fprintf('The best model for Greece is y = (%f) * x + (%f)\n',b(2,i+1),b(1,i+1))

% Same, 1 day delay.

%% Ireland

adjR2 = zeros(21,1);
e_standard = zeros(length(normalised_cases_ireland),21);
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
    e_standard(:,t+1) = (deaths_sample'-y(:,t+1))/sqrt(se2);
end

[~,i] = max(adjR2);
figure()
scatter(y(:,i+1),e_standard(:,i+1))
hold on
plot(xlim,-1.96*[1 1],'--c')
plot(xlim,1.96*[1 1],'--c')
title('Diagnostic Plot for Ireland')

fprintf('The best delay for Ireland is %.0f days\n',i);
fprintf('The best model for Ireland is y = (%f) * x + (%f)\n',b(2,i+1),b(1,i+1))

%Same

%++Comments, soon

