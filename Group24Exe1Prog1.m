%Executive for confirmed cases. Our country is United Kingdom. The wave is defined in the txt file.
%Efstathios Dimitriadis 84xx
%Emmanouil Mylonas 9508

cases = [148 259 406	484	478	361	442	611	769	999	1055	1255	1198	1378	2338	2375	2692	3087	3197	2822	2858	4273	4514	4913	4868	4911	4020	3592	5282	5450	5131	4858	4313	3579	3489	4178	4326	5065	5292	4956	4721	3853	4854	4760	5487	5158	4970	3748	3473	4706	4729	5442	4966	4737	3229	2982	3389	3682	3827	3767	3063	2157	2329	3586	3402	3307	2628	2526	2079	1838	2589	3052	2718	2574	2062	1527	1364	1624	1672	1835	1760	1527	1125	1079	1441	1484	1356	1243	1120	801	721	1099	1158	1199	1017	1052	890	822	1043	1102	1013	1027	986	687	639	896	886	778	721	671	649	446	730	617	651	602	579	401];
normalised_cases = cases/sum(cases);
days = 1:length(cases);

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


%Kolmogorov-Smirnov test with our tyxaia metavliti and the generated
%vector. The p-values are all too small to compare.
[H1,P1] = kstest2(y1,normalised_cases);
[H2,P2] = kstest2(y2,normalised_cases);
[H3,P3] = kstest2(y3,normalised_cases);
[H4,P4] = kstest2(y4,normalised_cases);
[H5,P5] = kstest2(y5,normalised_cases);


%instead of p-values, we choose mean square error
diff1 = 0; diff2 = 0; diff3 = 0; diff4 = 0; diff5 = 0;
for i = 1:length(days)
    diff1 = diff1 + abs(normalised_cases(i)^2-y1(i)^2);
    diff2 = diff2 + abs(normalised_cases(i)^2-y2(i)^2);
    diff3 = diff3 + abs(normalised_cases(i)^2-y3(i)^2);
    diff4 = diff4 + abs(normalised_cases(i)^2-y4(i)^2);
    diff5 = diff5 + abs(normalised_cases(i)^2-y5(i)^2);
end

difeerencies = [diff1,diff2,diff3,diff4,diff5];
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

