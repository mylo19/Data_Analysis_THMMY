%alternative solution for executive 2. It will be combined with Fun2. Not
%final yet

Group24Exe1Prog3
c = 'Confirmed Cases';
d = 'Confirmed Deaths';

Countries = ["Austria", "Belgium", "Denmark", "France", "Germany", "Greece", ...
            "Ireland", "Italy", "Russia", "Sweden"];

cases_distribution = Group24Exe1Fun1(normalised_cases_uk);
deaths_distribution = Group24Exe1Fun1(normalised_deaths_uk);

Group24Exe2Fun2(normalised_cases_sweden, cases_distribution)
Group24Exe2Fun2(normalised_deaths_sweden, deaths_distribution)

Group24Exe2Fun2(normalised_cases_austria, cases_distribution)
Group24Exe2Fun2(normalised_deaths_austria, deaths_distribution)

Group24Exe2Fun2(normalised_cases_belgium, cases_distribution)
Group24Exe2Fun2(normalised_deaths_belgium, deaths_distribution)

Group24Exe2Fun2(normalised_cases_denmark, cases_distribution)
Group24Exe2Fun2(normalised_deaths_denmark, deaths_distribution)

Group24Exe2Fun2(normalised_cases_france, cases_distribution)
Group24Exe2Fun2(normalised_deaths_france, deaths_distribution)

Group24Exe2Fun2(normalised_cases_germany, cases_distribution)
Group24Exe2Fun2(normalised_deaths_germany, deaths_distribution)

Group24Exe2Fun2(normalised_cases_greece, cases_distribution)
Group24Exe2Fun2(normalised_deaths_greece, deaths_distribution)

Group24Exe2Fun2(normalised_cases_ireland, cases_distribution)
Group24Exe2Fun2(normalised_deaths_ireland, deaths_distribution)

Group24Exe2Fun2(normalised_cases_italy, cases_distribution)
Group24Exe2Fun2(normalised_deaths_italy, deaths_distribution)

Group24Exe2Fun2(normalised_cases_russia, cases_distribution)
Group24Exe2Fun2(normalised_deaths_russia, deaths_distribution)

Group24Exe2Fun2(normalised_cases_sweden, cases_distribution)
Group24Exe2Fun2(normalised_deaths_sweden, deaths_distribution)
