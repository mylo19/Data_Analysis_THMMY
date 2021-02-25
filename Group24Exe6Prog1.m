%Efstathios Dimitriadis 8490
%Emmanouil Mylonas 9508

Group24Exe1Prog3

adjRsq = @(ypred,y,n,k) ( 1 - (n-1)/(n-1-k)*sum((ypred-y).^2)/sum((y-mean(y)).^2) );

%% United Kingdom

adjR2_simple = zeros(21,1);
adjR2_multiple = zeros(21,2);
adjR2_step = zeros(21,1);
order = 0;
e_standard_simple = zeros(length(normalised_cases_uk),21);
y = zeros(length(normalised_cases_uk),21);
b = zeros(2,21);

for t=0:20
    deaths_sample = total_deaths_uk(50+t:210+t)/sum(total_deaths_uk(50+t:210+t)); 
    cases_sample = [ones(size(normalised_cases_uk')) normalised_cases_uk'];
    
    %Simple regression
    b(:,t+1) = regress(deaths_sample', cases_sample);
    n = length(deaths_sample);
    y(:,t+1) = cases_sample*b(:,t+1);
    adjR2_simple(t+1) = adjRsq(y(:,t+1),deaths_sample',n,1);
    se2 = sum((deaths_sample'-y(:,t+1)).^2/(n-2));
    e_standard_simple(:,t+1) = (deaths_sample'-y(:,t+1))/sqrt(se2);
    
    %Multiple linear regression (maybe not correct term :P)
    
    maxadjR2_linear = 0;
    for k=1:4 %order of our regression - up to 4 because after that we receive a warning for polynomial being badly conditioned
        b2 = polyfit(normalised_cases_uk,deaths_sample,k);
        ypred = polyval(b2,normalised_cases_uk);
        adjR2 = adjRsq(ypred,deaths_sample,n,k);
        if adjR2 > maxadjR2_linear
            order = k;
            maxadjR2_linear = adjR2;
        end
    end
    adjR2_multiple((t+1),1) = maxadjR2_linear;
    adjR2_multiple((t+1),2) = order;
    
    % Step wise regression
    [b3,~,~,model,stats] = stepwisefit(normalised_cases_uk',deaths_sample','display','Off');
    b0 = stats.intercept;
    b3 = [b0; b3(model)]; 
    Ypred = cases_sample*b3;
    adjR2_step(t+1) = adjRsq(Ypred, deaths_sample', n, length(b));

end

% [value1,pos1] = max(adjR2_simple);
% [value2, pos2] = max(adjR2_multiple;


%rest of the countries need to be added and reach conclusion, other than
%that it is ready.
