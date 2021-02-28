function [adjR2] = Group24Exe8Fun2(total_cases,total_deaths,start_date,end_date, b,k)
    
deaths_sample = total_deaths(start_date:end_date)/sum(start_date:end_date);
n = length(deaths_sample);
cases_sample = zeros(n,21);
for t = 0:20
    cases_sample(:,t+1) = total_cases(start_date-t:end_date-t)/sum(total_cases(start_date-t:end_date-t));
end

ypred = [ones(n,1), cases_sample]*b;
mD = mean(deaths_sample);
adjR2 = ( 1 - (n-1)/(n-1-k)*sum((ypred-deaths_sample').^2)/sum((deaths_sample'-mD).^2) );
end