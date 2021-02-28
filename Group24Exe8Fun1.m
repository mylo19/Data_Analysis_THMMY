%Efstathios Dimitriadis 8490
%Emmanouil Mylonas 9508
%LASSO model. The outputs of this function are the b Coefficients, the
%number of dimensions we now have and the adjR2. All of them will be used
%either in the prediction model, or to compare the two.

function [bLASSO, k, adjR2] = Group24Exe8Fun1(total_cases,total_deaths,start_date,end_date)
    deaths_sample = total_deaths(start_date:end_date)/sum(total_deaths(start_date:end_date));
    n = length(deaths_sample);
    cases_sample = zeros(n,21);
    for t=0:20
        cases_sample(:,t+1) = total_cases(start_date-t:end_date-t);
        cases_sample(:,t+1) = cases_sample(:,t+1)/sum(cases_sample(:,t+1));
    end
    
    % LASSO
    B = lasso(cases_sample, deaths_sample);
    bLASSO = B(:,82);
    mD = mean(deaths_sample);
    mC = mean(cases_sample);
    bLASSO = [mD - mC*bLASSO; bLASSO];
    k = sum(bLASSO~=0);
    ypred = [ones(n,1), cases_sample]*bLASSO;
    adjR2 = ( 1 - (n-1)/(n-1-k)*sum((ypred-deaths_sample').^2)/sum((deaths_sample'-mD).^2) ); 

    %% Other implementations for testing
    
%     % PCR
%     mC = mean(cases_sample);
%     mD = mean(deaths_sample);
%     cases_sample_centered = cases_sample - repmat(mC,n,1);
%     deaths_sample_centered = deaths_sample' - repmat(mD,n,1);
%     
%     [U,Sigma,V] = svd(cases_sample_centered,'econ');
%     lamda = zeros(21,1);
%     lamda(1:5) = 1;
%     bPCR = V * diag(lamda)*inv(Sigma)*U'*deaths_sample_centered;
%     %bPCRV = vM * diag(lambdaV) * inv(sigmaM) * uM'* ycV;
%     b0 = mD - mC*bPCR;
%     bPCR = [b0 ;bPCR];
    
%     %Ridge
%     bRidge = ridge(deaths_sample_centered,cases_sample_centered,1,0);
% 
%     %PLS
%     [~,~,~,~,bPLSV] = plsregress(cases_sampledeaths_sample',10);
%     
%     [b,~,~,model,stats] = stepwisefit(cases_sample,deaths_sample','display','Off');
    
end