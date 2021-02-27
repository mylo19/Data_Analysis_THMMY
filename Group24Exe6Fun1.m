%Efstathios Dimitriadis 8490
%Emmanouil Mylonas 9508

function [model, b, b2] = Group24Exe6Fun1(total_cases, total_deaths, start_cases, end_cases, adjR2_simple,name)
   
    adjRsq = @(ypred,y,n,k) ( 1 - (n-1)/(n-1-k)*sum((ypred-y).^2)/sum((y-mean(y)).^2) );
    deaths_sample = total_deaths(start_cases:end_cases)/sum(total_deaths(start_cases:end_cases));
    n = length(deaths_sample);
    cases_sample = zeros(n,21);

    for t=0:20
        cases_sample(:,t+1) = total_cases(start_cases-t:end_cases-t);
        cases_sample(:,t+1) = cases_sample(:,t+1)/sum(cases_sample(:,t+1));
    end
    %Stepwise Regression
    [b,~,~,model,stats] = stepwisefit(cases_sample,deaths_sample','display','Off');
    b0 = stats.intercept;
    b = [b0; b(model)]; 

    Ypred = [ones(length(cases_sample),1) cases_sample(:,model)]*b;
    errors = deaths_sample' - Ypred;
    rms_step = stats.rmse;
    rmse_step = errors/rms_step;
    adjR2_step = adjRsq(Ypred,deaths_sample',n,length(b));

%     figure()
%     scatter(Ypred,rmse_step)
%     hold on
%     plot(xlim,-1.96*[1 1],'--c');
%     plot(xlim,1.96*[1 1],'--c');
%     title('Diagnostic plot - Stepwise Regression - UK');

    %Full 21 Model
    regressionModel = fitlm(cases_sample,deaths_sample');
    b2 = table2array(regressionModel.Coefficients);
    b2 = b2(:,1);

    ypred = [ones(n,1) cases_sample]*b2;
    errors = deaths_sample' - ypred;
    rms_full = sqrt( 1/(n-length(b2))*sum(errors).^2 );
    rmse_full = errors/rms_full;
    adjR2_full = adjRsq(ypred,deaths_sample',n,length(b2));

%     figure()
%     scatter(ypred,rmse_full)
%     hold on
%     plot(xlim,-1.96*[1 1],'--c');
%     plot(xlim,1.96*[1 1],'--c');
    %This doesn't work, I dont know why there is a problem with title.
    %title(sprintf('Diagnostic plot - Full Model - %s', name));

    if adjR2_simple >= adjR2_step && adjR2_simple>= adjR2_full
        fprintf('The best model for %s is simple linear regression\n',name)
    elseif adjR2_step> adjR2_simple && adjR2_step >= adjR2_full
        fpritf('The best model for %s is Stepwise Regression, with .0%f variables\n',name, length(b))
    else
        fprintf('The best model for %s is the full 21-variables model\n',name)
        model = regressionModel;
    end
end