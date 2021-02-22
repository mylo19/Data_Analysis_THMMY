days_cases = zeros(1,11);
days_deaths = zeros(1,11);

Group24Exe1Prog3
close all

days_cases(1) = Group24Exe3Fun2(normalised_cases_uk);
days_deaths(1) = Group24Exe3Fun2(normalised_deaths_uk);

days_cases(2) = Group24Exe3Fun2(normalised_cases_austria);
days_deaths(2) = Group24Exe3Fun2(normalised_deaths_austria);
days_deaths(2) = days_deaths(2) + 10; %The deaths wave in Austria starts 10
%days later than the cases wave, hence to compare these two we need to add
%the difference. The same procedure is done in the rest countries.

days_cases(3) = Group24Exe3Fun2(normalised_cases_belgium);
days_deaths(3) = Group24Exe3Fun2(normalised_deaths_belgium);
%In Belgium, same as in UK the waves for the deaths and cases start at the
%same day, hence there is no need in adding the difference.

days_cases(4) = Group24Exe3Fun2(normalised_cases_denmark);
days_deaths(4) = Group24Exe3Fun2(normalised_deaths_denmark);
days_deaths(4) = days_deaths(4) + 9;

days_cases(5) = Group24Exe3Fun2(normalised_cases_france);
days_deaths(5) = Group24Exe3Fun2(normalised_deaths_france);
days_deaths(5) = days_deaths(5) + 8; 

days_cases(6) = Group24Exe3Fun2(normalised_cases_germany);
days_deaths(6) = Group24Exe3Fun2(normalised_deaths_germany);
days_deaths(6) = days_deaths(6) + 10;

days_cases(7) = Group24Exe3Fun2(normalised_cases_greece);
days_deaths(7) = Group24Exe3Fun2(normalised_deaths_greece);
days_deaths(7) = days_deaths(7) + 11;

days_cases(8) = Group24Exe3Fun2(normalised_cases_ireland);
days_deaths(8) = Group24Exe3Fun2(normalised_deaths_ireland);
days_deaths(8) = days_deaths(7) + 8;

days_cases(9) = Group24Exe3Fun2(normalised_cases_italy);
days_deaths(9) = Group24Exe3Fun2(normalised_deaths_italy);

days_cases(10) = Group24Exe3Fun2(normalised_cases_russia);
days_deaths(10) = Group24Exe3Fun2(normalised_deaths_russia);
days_deaths(10) = days_deaths(10) + 10;

%Sweden has a really big difference, the day with the most deaths
%proceeds the day with the most cases by 38 days, which really messes up
%our sample, hence we comment it out
% days_cases(11) = Group24Exe3Fun2(normalised_cases_sweden);
% days_deaths(11) = Group24Exe3Fun2(normalised_deaths_sweden);
% days_deaths(11) = days_deaths(11) + 9;

days_cases(11) = Group24Exe3Fun2(normalised_cases_switzerland);
days_deaths(11) = Group24Exe3Fun2(normalised_deaths_switzerland)+19;


days_dif = days_deaths-days_cases;

[~,~,CI] = ttest(days_dif(1:10));
ci = bootci(1000,@mean,days_dif(1:10));

fprintf('The interval derived from the parametric test is: [%.4f  %.4f]\n',CI(1),CI(2))
fprintf('The interval derived from the bootstap test is: [%.4f  %.4f]\n', ci(1),ci(2))

%both intervals do not contain 14. That means that we cannot say that
%deaths follow cases with a 14-day delay. What is more interesting is that
%according to those intervals, we see that the days with the most deaths
%actually may precede the days with the most cases. Maybe that doesn't make
%much sense statistically, but if we examine it from our perspective, it is
%actually expected. COVID-19 was a new desease during the 1st wave with a
%much higher death rate, as you can see here, in the last part: Outcome https://www.worldometers.info/coronavirus/coronavirus-cases/?fbclid=IwAR3y740mnBvcLrRkLttnNIGnJ8AsBAdNpUPE8zYp_QmuUA3G5oFqXbpZzOs#case-outcome
%Since then, we may have more active cases, but fewer deaths, hence those
%intervals.
