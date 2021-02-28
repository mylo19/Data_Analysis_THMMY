%Efstathios Dimitriadis 8490
%Emmanouil Mylonas 9508

function adjR2 = Group24Exe7Fun1(model, total_cases, total_deaths, start_cases, end_cases, name)
%GROUP24EXE7FUN1 Predict the deaths for the second wave and print
%the adjusted coefficient of determination
    adjRsq = @(ypred,y,n,k) ( 1 - (n-1)/(n-1-k)*sum((ypred-y).^2)/sum((y-mean(y)).^2) );

    % To deal with the different domains between the first and second waves
    % for some countries we normalise the datasets for cases and deaths
    % like we did for the first wave. 
    % This is a must for COVID datasets because for almost all
    % countries the cases skyrocket during the second wave while the deaths
    % do not register such a drastic increase, or they even decrease for
    % some countries. There are also countries like Ireland where the cases
    % didn't register a big increase but the deaths decreased to 
    % 1/6th-1/10th compared to the first wave.
    deaths_sample = total_deaths(start_cases:end_cases)/sum(total_deaths(start_cases:end_cases));
    n = length(deaths_sample);
    cases_sample = zeros(n,21);

    for t=0:20
        cases_sample(:,t+1) = total_cases(start_cases-t:end_cases-t);
        cases_sample(:,t+1) = cases_sample(:,t+1)/sum(cases_sample(:,t+1));
    end
    Ypred = predict(model, cases_sample);
    b = table2array(model.Coefficients);
    b = b(:,1);
    adjR2 = adjRsq(Ypred,deaths_sample',n,length(b));
    
    fprintf('The coefficient of determination for %s validation dataset is %.4f\n',name, adjR2)
end

