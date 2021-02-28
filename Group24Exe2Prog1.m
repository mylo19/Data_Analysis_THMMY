%Efstathios Dimitriadis 8490
%Emmanouil Mylonas 9508
%In this program we save the best fitting distributions for cases/deaths
%for UK and then we compare it with the other 11 countries and in the end
%we print the results.

Group24Exe1Prog3

cases_distribution = Group24Exe1Fun1(normalised_cases_uk);
deaths_distribution = Group24Exe1Fun1(normalised_deaths_uk);

swi(1) = Group24Exe2Fun2(normalised_cases_switzerland, cases_distribution);
swi(2) = Group24Exe2Fun2(normalised_deaths_switzerland, deaths_distribution);

au(1) = Group24Exe2Fun2(normalised_cases_austria, cases_distribution);
au(2) = Group24Exe2Fun2(normalised_deaths_austria, deaths_distribution);

be(1) = Group24Exe2Fun2(normalised_cases_belgium, cases_distribution);
be(2) = Group24Exe2Fun2(normalised_deaths_belgium, deaths_distribution);

de(1) = Group24Exe2Fun2(normalised_cases_denmark, cases_distribution);
de(2) = Group24Exe2Fun2(normalised_deaths_denmark, deaths_distribution);

fr(1) = Group24Exe2Fun2(normalised_cases_france, cases_distribution);
fr(2) = Group24Exe2Fun2(normalised_deaths_france, deaths_distribution);

ge(1) = Group24Exe2Fun2(normalised_cases_germany, cases_distribution);
ge(2) = Group24Exe2Fun2(normalised_deaths_germany, deaths_distribution);

gr(1) = Group24Exe2Fun2(normalised_cases_greece, cases_distribution);
gr(2) = Group24Exe2Fun2(normalised_deaths_greece, deaths_distribution);

ir(1) = Group24Exe2Fun2(normalised_cases_ireland, cases_distribution);
ir(2) = Group24Exe2Fun2(normalised_deaths_ireland, deaths_distribution);

it(1) = Group24Exe2Fun2(normalised_cases_italy, cases_distribution);
it(2) = Group24Exe2Fun2(normalised_deaths_italy, deaths_distribution);

ru(1) = Group24Exe2Fun2(normalised_cases_russia, cases_distribution);
ru(2) = Group24Exe2Fun2(normalised_deaths_russia, deaths_distribution);

swe(1) = Group24Exe2Fun2(normalised_cases_sweden, cases_distribution);
swe(2) = Group24Exe2Fun2(normalised_deaths_sweden, deaths_distribution);


cases = [swi', au', be', de', fr', ge', gr', ir', it', ru', swe'];
cases(1,:) = sort(cases(1,:),'descend');
cases(2,:) = sort(cases(2,:),'descend');

for k=1:2
    if k==1
        disp('The countries from best to worst fitting for cases are:')
    else
        disp('The countries from best to worst fitting for deaths are:') 
    end
    for i=1:length(cases)
        switch cases(k,i)
            case swi(k)
                disp('Switzerland')
            case au(k)
                disp('Austria')
            case be(k)
            disp('Belgium')
            case de(k)
                disp('Denmark')
            case fr(k)
                disp('France')
            case ge(k)
                disp('Germany')
            case gr(k) 
            disp('Greece')
            case ir(k)
                disp('Ireland')
            case it(k)
                disp('Italy')
            case ru(k)
                disp('Russia')
            case swe(k)
                disp('Sweden')
        end
    end
end
    
% The distribution found for UK seems to fit well for most European
% countries both for cases and deaths since the LSE is very small, except
% for Russia which is expected since the distribution of cases/deaths there
% is quite different than the rest of the countries, something that is 
% discernible even from their plot.
    
    