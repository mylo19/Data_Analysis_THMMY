%Efstathios Dimitriadis 8490
%Emmanouil Mylonas 9508
%OLS using SVD algorithm.

function [bOLS] = Group24Exe8Fun1(total_cases,total_deaths,start_date,end_date)
    deaths_sample = total_deaths(start_date:end_date)/sum(total_deaths(start_date:end_date));
    n = length(deaths_sample);
    cases_sample = zeros(n,21);
    for t=0:20
        cases_sample(:,t+1) = total_cases(start_date-t:end_date-t);
        cases_sample(:,t+1) = cases_sample(:,t+1)/sum(cases_sample(:,t+1));
    end
    
    % OLS
    m = mean(cases_sample);
    cases_sample_centered = cases_sample - repmat(m,n,1);
    
    [U,Sigma,V] = svd(cases_sample_centered,'econ');
    bOLS = V*Sigma\U'*deaths_sample';    
end