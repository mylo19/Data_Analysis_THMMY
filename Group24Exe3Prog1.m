days_cases = zeros(1,11);
days_deaths = zeros(1,11);

Group24Exe1Prog3

days_cases(1) = Group24Exe3Fun2(normalised_cases_uk);
days_deaths(1) = Group24Exe3Fun2(normalised_deaths_uk);

days_cases(2) = Group24Exe3Fun2(normalised_cases_austria);
days_deaths(2) = Group24Exe3Fun2(normalised_deaths_austria);

days_cases(3) = Group24Exe3Fun2(normalised_cases_belgium);
days_deaths(3) = Group24Exe3Fun2(normalised_deaths_belgium);

days_cases(4) = Group24Exe3Fun2(normalised_cases_denmark);
days_deaths(4) = Group24Exe3Fun2(normalised_deaths_denmark);

days_cases(5) = Group24Exe3Fun2(normalised_cases_france);
days_deaths(5) = Group24Exe3Fun2(normalised_deaths_france);

days_cases(6) = Group24Exe3Fun2(normalised_cases_germany);
days_deaths(6) = Group24Exe3Fun2(normalised_deaths_germany);

days_cases(7) = Group24Exe3Fun2(normalised_cases_greece);
days_deaths(7) = Group24Exe3Fun2(normalised_deaths_greece);

days_cases(8) = Group24Exe3Fun2(normalised_cases_ireland);
days_deaths(8) = Group24Exe3Fun2(normalised_deaths_ireland);

days_cases(9) = Group24Exe3Fun2(normalised_cases_italy);
days_deaths(9) = Group24Exe3Fun2(normalised_deaths_italy);

days_cases(10) = Group24Exe3Fun2(normalised_cases_russia);
days_deaths(10) = Group24Exe3Fun2(normalised_deaths_russia);

days_cases(11) = Group24Exe3Fun2(normalised_cases_sweden);
days_deaths(11) = Group24Exe3Fun2(normalised_deaths_sweden);

days_dif = days_deaths-days_cases;

