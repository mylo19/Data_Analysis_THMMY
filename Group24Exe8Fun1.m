%Efstathios Dimitriadis 8490
%Emmanouil Mylonas 9508
%PCR using SVD algorithm.

function [bPCR] = Group24Exe8Fun1(total_cases,total_deaths,start_date,end_date)
    deaths_sample = total_deaths(start_date:end_date)/sum(total_deaths(start_date:end_date));
    n = length(deaths_sample);
    cases_sample = zeros(n,21);
    for t=0:20
        cases_sample(:,t+1) = total_cases(start_date-t:end_date-t);
        cases_sample(:,t+1) = cases_sample(:,t+1)/sum(cases_sample(:,t+1));
    end
    
    % Lasso 
    B = lasso(cases_sample, deaths_sample);
    disp(B(:,50))

    mC = mean(cases_sample);
    mD = mean(deaths_sample);
    cases_sample_centered = cases_sample - repmat(mC,n,1);
    deaths_sample_centered = deaths_sample' - repmat(mD,n,1);
    
    [U,Sigma,V] = svd(cases_sample_centered,'econ');
    lamda = zeros(21,1);
    lamda(1:5) = 1;
    bPCR = V * diag(lamda)*inv(Sigma)*U'*deaths_sample_centered;
    %bPCRV = vM * diag(lambdaV) * inv(sigmaM) * uM'* ycV;
    b0 = mD - mC*bPCR;
    bPCR = [b0 ;bPCR];
    
end