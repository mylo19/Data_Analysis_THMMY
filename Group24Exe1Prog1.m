%Executive for confirmed cases. Our country is United Kingdom. The wave is defined in the txt file.
%Efstathios Dimitriadis 84xx
%Emmanouil Mylonas 9508

Group24Exe1Prog3
days = 1:length(normalised_cases_uk);

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


%Kolmogorov-Smirnov test with our random variable and the generated
%vector. The p-values are all too small to compare.
[H1,P1] = kstest2(y1,normalised_cases_uk);
[H2,P2] = kstest2(y2,normalised_cases_uk);
[H3,P3] = kstest2(y3,normalised_cases_uk);
[H4,P4] = kstest2(y4,normalised_cases_uk);
[H5,P5] = kstest2(y5,normalised_cases_uk);


%instead of p-values, we choose mean square error
diff1 = 0; diff2 = 0; diff3 = 0; diff4 = 0; diff5 = 0;
for i = 1:length(days)
    diff1 = diff1 + (normalised_cases_uk(i)-y1(i)^2);
    diff2 = diff2 + (normalised_cases_uk(i)-y2(i))^2;
    diff3 = diff3 + (normalised_cases_uk(i)-y3(i))^2;
    diff4 = diff4 + (normalised_cases_uk(i)-y4(i))^2;
    diff5 = diff5 + (normalised_cases_uk(i)-y5(i))^2;
end
diff1 = diff1/length(days);
diff2 = diff2/length(days);
diff3 = diff3/length(days);
diff4 = diff4/length(days);
diff5 = diff5/length(days);

minimum = min([diff1,diff2,diff3,diff4,diff5]);
switch minimum
    case diff1
        disp('The fitting distribution is Normal')
    case diff2
        disp('The fitting distribution is Half Normal')
    case diff3
        disp('The fitting distribution is Poisson')
    case diff4 
        disp('The fitting distribution is Rayleigh')
    case diff5
        disp('The fitting distribution is lognormal')
end

