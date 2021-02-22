%Efstathios Dimitriadis 8490
%Emmanouil Mylonas 9508
%This function is not used in the Program. We created it as a side test, to
%find the fitting distribution for each country's cases/deaths and helped
%us to confirm our results.

function [] = Group24Exe2Fun1(normalised_sample, country_name,action)
    days = 1:length(normalised_sample);

    %Create 5 objects  with 5 different distributions
    P1 = fitdist(days', 'normal');
    P2 = fitdist(days', 'half normal');
    P3 = fitdist(days', 'poisson');
    P4 = fitdist(days', 'rayleigh');
    P5 = fitdist(days', 'lognormal');

    %Create vectors with numbers generated with the equivalent distribution of
    %each object. The size is the same with our sample
    y1 = pdf(P1,days);
    y2 = pdf(P2,days);
    y3 = pdf(P3,days);
    y4 = pdf(P4,days);
    y5 = pdf(P5,days);
    
    diff1 = 0; diff2 = 0; diff3 = 0; diff4 = 0; diff5 = 0;
    for i = 1:length(days)
        diff1 = diff1 + (normalised_sample(i)-y1(i)^2);
        diff2 = diff2 + (normalised_sample(i)-y2(i))^2;
        diff3 = diff3 + (normalised_sample(i)-y3(i))^2;
        diff4 = diff4 + (normalised_sample(i)-y4(i))^2;
        diff5 = diff5 + (normalised_sample(i)-y5(i))^2;
    end
    diff1 = diff1/length(days);
    diff2 = diff2/length(days);
    diff3 = diff3/length(days);
    diff4 = diff4/length(days);
    diff5 = diff5/length(days);
    
    minimum = min([diff1,diff2,diff3,diff4,diff5]);
    switch minimum 
        case diff1
            fprintf('The fitting distribution for %s - %s is Normal\n', country_name,action)
        case diff2
            fprintf('The fitting distribution for %s - %s is Half Normal\n', country_name,action)
        case diff3
            fprintf('The fitting distribution for %s - %s is Poisson\n', country_name,action)
        case diff4 
            fprintf('The fitting distribution for %s - %s is Rayleigh\n', country_name,action)
        case diff5
            fprintf('The fitting distribution for %s - %s is lognormal\n', country_name,action)
    end

end

