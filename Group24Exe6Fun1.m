function [simpleRegression,multipleRegression] = Group24Exe6Fun1(normalized_cases, total_deaths, start_deaths, end_deaths)
%GROUP24EXE6FUN1 Summary of this function goes here
%   Detailed explanation goes here
adjRsq = @(ypred,y,n,k) ( 1 - (n-1)/(n-1-k)*sum((ypred-y).^2)/sum((y-mean(y)).^2) );

adjR2_simple = zeros(21,1);
adjR2_multiple = zeros(21,2);
adjR2_step = zeros(21,1);
order = 0;
e_standard_simple = zeros(length(normalized_cases),21);
y = zeros(length(normalized_cases),21);
b = zeros(2,21);

for t=0:20
    deaths_sample = total_deaths(start_deaths+t:end_deaths+t)/sum(total_deaths(start_deaths+t:end_deaths+t)); 
    cases_sample = [ones(size(normalized_cases')) normalized_cases'];
    
    %Simple regression
    b(:,t+1) = regress(deaths_sample', cases_sample);
    n = length(deaths_sample);
    y(:,t+1) = cases_sample*b(:,t+1);
    adjR2_simple(t+1) = adjRsq(y(:,t+1),deaths_sample',n,1);
    se2 = sum((deaths_sample'-y(:,t+1)).^2/(n-2));
    e_standard_simple(:,t+1) = (deaths_sample'-y(:,t+1))/sqrt(se2);
    
    %Multiple linear regression
    
    maxadjR2_linear = 0;
    for k=1:4 %order of our regression - up to 4 because after that we receive a warning for polynomial being badly conditioned
        b2 = polyfit(normalized_cases,deaths_sample,k);
        ypred = polyval(b2,normalized_cases);
        adjR2 = adjRsq(ypred,deaths_sample,n,k);
        if adjR2 > maxadjR2_linear
            order = k;
            maxadjR2_linear = adjR2;
        end
    end
    adjR2_multiple((t+1),1) = maxadjR2_linear;
    adjR2_multiple((t+1),2) = order;
    
    % Step wise regression
    fprintf("Iteration %d\n", t);
    [b3,~,~,model,stats] = stepwisefit(normalized_cases',deaths_sample','display','Off')
    b0 = stats.intercept;
    b3 = [b0; b3(model)];
    Ypred = cases_sample*b3;
    adjR2_step(t+1) = adjRsq(Ypred, deaths_sample', n, length(b));
    

end

[value1,pos1]= max(adjR2_simple);
[value2, pos2] = max(adjR2_multiple);
simpleRegression = [value1,pos1];
multipleRegression = [value2, pos2];

end

