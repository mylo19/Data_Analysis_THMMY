function [] = Group24Exe2Fun1(normalised_cases, country_name,action)
    days = 1:length(normalised_cases);

    %Create 5 objects  with 5 different distributions
    P1 = fitdist(days', 'normal');
    P2 = fitdist(days', 'half normal');
    P3 = fitdist(days', 'poisson');
    P4 = fitdist(days', 'rayleigh');
    P5 = fitdist(days', 'lognormal');

    %Create vectors with numbers generated with the according distribution of
    %each object. The size is the same with our sample
    y1 = pdf(P1,days);
    y2 = pdf(P2,days);
    y3 = pdf(P3,days);
    y4 = pdf(P4,days);
    y5 = pdf(P5,days);
    
    diff1 = 0; diff2 = 0; diff3 = 0; diff4 = 0; diff5 = 0;
    for i = 1:length(days)
        diff1 = diff1 + (normalised_cases(i)-y1(i)^2);
        diff2 = diff2 + (normalised_cases(i)-y2(i))^2;
        diff3 = diff3 + (normalised_cases(i)-y3(i))^2;
        diff4 = diff4 + (normalised_cases(i)-y4(i))^2;
        diff5 = diff5 + (normalised_cases(i)-y5(i))^2;
    end
    
    minimum = min([diff1,diff2,diff3,diff4,diff5]);
    switch minimum %check how to print in with a string, it doesn't work, 
        %the goal is to print: The fiiting distribution for Austria - Cases
        %is Normal
        case diff1
            disp('The fitting distribution for ', country_name,'-',action, 'is Normal')
        case diff2
            disp('The fitting distribution for ', country_name,'-',action, 'Half Normal')
        case diff3
            disp('The fitting distribution for ', country_name,'-',action, 'Poisson')
        case diff4 
            disp('The fitting distribution for ', country_name,'-',action, 'Rayleigh')
        case diff5
            disp('The fitting distribution for ', country_name,'-',action, 'lognormal')
    end

end

