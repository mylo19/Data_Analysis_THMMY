%Executive for confirmed deaths. Our country is United Kingdom. The wave is defined in the txt file.
%Efstathios Dimitriadis 84xx
%Emmanouil Mylonas 9508

deaths = [148	191	181	288	292	212	374	403	672	657	736	756	599	567	1105	1030	1116	1122	843	657	724	1076	880	1036	913	1105	432	570	1224	847	682	1010	815	364	320	969	769	634	698	584	253	272	726	647	458	579	275	217	187	614	447	352	350	411	67	146	500	328	273	291	220	379	104	131	422	343	274	154	60	86	249	254	130	258	143	54	47	195	164	76	131	107	27];
normalised_deaths = deaths/sum(deaths);
days = 1:length(deaths);

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
[H1,P1] = kstest2(y1,normalised_deaths);
[H2,P2] = kstest2(y2,normalised_deaths);
[H3,P3] = kstest2(y3,normalised_deaths);
[H4,P4] = kstest2(y4,normalised_deaths);
[H5,P5] = kstest2(y5,normalised_deaths);


%instead of p-values, we choose mean square error
diff1 = 0; diff2 = 0; diff3 = 0; diff4 = 0; diff5 = 0;
for i = 1:length(days)
    diff1 = diff1 + abs(normalised_deaths(i)^2-y1(i)^2);
    diff2 = diff2 + abs(normalised_deaths(i)^2-y2(i)^2);
    diff3 = diff3 + abs(normalised_deaths(i)^2-y3(i)^2);
    diff4 = diff4 + abs(normalised_deaths(i)^2-y4(i)^2);
    diff5 = diff5 + abs(normalised_deaths(i)^2-y5(i)^2);
end
diff1 = diff1/length(days);
diff2 = diff2/length(days);
diff3 = diff3/length(days);
diff5 = diff4/length(days);
diff5 = diff5/length(days);

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

