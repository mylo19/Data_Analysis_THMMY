%Efstathios Dimitriadis 8490
%Emmanouil Mylonas 9508

Group24Exe1Prog3

adjRsq = @(ypred,y,n,k) ( 1 - (n-1)/(n-1-k)*sum((ypred-y).^2)/sum((y-mean(y)).^2) );

%% United Kingdom

adjR2_simple = zeros(21,1);
adjR2_multiple = zeros(21,2);
adjR2_step = zeros(21,1);
order = 0;
n = length(normalised_cases_uk);
rmse_linear = zeros(n,21);
rmse_multiple = zeros(n,21);
rmse_step = zeros(n,21);
y_linear = zeros(n,21);
y_multiple = zeros(n,21);
y_step = zeros(n,21);
b_linear = zeros(2,21);
b_multiple = zeros(5,21);
b_step = zeros(2,21);


for t=0:20
    deaths_sample = total_deaths_uk(50+t:210+t)/sum(total_deaths_uk(50+t:210+t)); 
    cases_sample = [ones(size(normalised_cases_uk')) normalised_cases_uk'];
    
    %Simple regression
    b_linear(:,t+1) = regress(deaths_sample', cases_sample);
    y_linear(:,t+1) = cases_sample*b_linear(:,t+1);
    adjR2_simple(t+1) = adjRsq(y_linear(:,t+1),deaths_sample',n,1);
    se2 = sum((deaths_sample'-y_linear(:,t+1)).^2/(n-2));
    rmse_linear(:,t+1) = (deaths_sample'-y_linear(:,t+1))/sqrt(se2);
    
    %Multiple linear regression (maybe not correct term :P)
    
    maxadjR2_linear = 0;
    rmse_local = zeros(n,4);
    for k=2:4 %order of our regression - up to 4 because after that we receive a warning for polynomial being badly conditioned
        b2 = polyfit(normalised_cases_uk,deaths_sample,k);
        ypred = polyval(b2,normalised_cases_uk);
        adjR2 = adjRsq(ypred,deaths_sample,n,k);
        se2 = sum((deaths_sample-ypred).^2/(n-2));
        rmse_local(:,k) = (deaths_sample-ypred)/sqrt(se2);
        if adjR2 > maxadjR2_linear
            order = k;
            maxadjR2_linear = adjR2;
            y_multiple(:,t+1) = ypred;
            if k==2
                b_multiple(1:3,t+1) = b2;
            elseif k==3
                b_multiple(1:4,t+1) = b2;
            else
                b_multiple(:,t+1) = b2;
            end
            
        end
    end
    adjR2_multiple((t+1),1) = maxadjR2_linear;
    adjR2_multiple((t+1),2) = order;
    rmse_multiple(:,t+1) = rmse_local(:,order);
    
    % Step wise regression
    [b3,~,~,model,stats] = stepwisefit(normalised_cases_uk',deaths_sample','display','Off');
    b0 = stats.intercept;
    b3 = [b0; b3(model)]; 
    y_step(:,t+1) = cases_sample*b3;
    adjR2_step(t+1) = adjRsq(y_step(:,t+1), deaths_sample', n, length(b_linear));
    se2 = sum((deaths_sample'-y_step(:,t+1)).^2/(n-2));
    rmse_step(:,t+1) = (deaths_sample'-y_step(:,t+1))/sqrt(se2);
    b_step(:,t+1) = b3;

end

%RESULTS

[value1,pos1] = max(adjR2_simple);
figure()
scatter(y_linear(:,pos1),rmse_linear(:,pos1))
hold on
plot(xlim,-1.96*[1 1],'--c')
plot(xlim,1.96*[1 1],'--c')
title('Diagnostic plot - simple Regression - UK');
fprintf('Linear Regression -  UK: y = (%f) * x + (%f)\n',b_linear(2,pos1),b_linear(1,pos1))
fprintf('Linear Regression - UK - delay = %.0f\n',pos1-1)
fprintf('Linear Regression - UK - Adjusted R = %f\n',value1)


%for the next two I have to find the model as well
[value2, pos2] = max(adjR2_multiple(:,1));
figure()
scatter(y_multiple(:,pos2),rmse_multiple(:,pos2))
hold on
plot(xlim,-1.96*[1 1],'--c')
plot(xlim,1.96*[1 1],'--c')
title('Diagnostic plot - multiple Regression - UK');
fprintf('Multiple Regression - UK: y = (%f) + (%f)*x + (%f)*x^2 + (%f)*x^3 + (%f)*x^4\n',b_multiple(1,pos2),b_multiple(2,pos2),b_multiple(3,pos2),b_multiple(4,pos2),b_multiple(5,pos2))
fprintf('Multiple Regression - UK - delay = %.0f\n',pos2-1)
fprintf('Multiple Regression - UK - Adjusted R = %f\n',value2)

[value3,pos3] = max(adjR2_step);
figure()
scatter(y_step(:,pos3),rmse_step(:,pos3))
hold on
plot(xlim,-1.96*[1 1],'--c')
plot(xlim,1.96*[1 1],'--c')
title('Diagnostic plot - Stepwise Regression - UK');
fprintf('Stepwise Regression -  UK: y = (%f) * x + (%f)\n',b_step(2,pos3),b_step(1,pos3))
fprintf('Stepwise Regression - UK - delay = %.0f\n',pos3-1)
fprintf('Stepwise Regression - UK - Adjusted R = %f\n',value3)



%rest of the countries need to be added and reach conclusion, other than
%that it is ready.
