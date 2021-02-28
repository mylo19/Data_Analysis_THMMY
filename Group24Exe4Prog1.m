%Efstathios Dimitriadis 8490
%Emmanouil Mylonas 9508

Group24Exe1Prog3

t_delay = zeros(1,6);
r_pearson = zeros(1,6);
%United Kindgdom
r =0;
tt = 10;
for t=-20:20
    deaths_sample = total_deaths_uk(50+t:210+t)/sum(total_deaths_uk(50+t:210+t)); 
    %the size of deaths needs to be the same with the size of cases, 
    %in order for the pearson r to be declared.
    R = corrcoef(normalised_cases_uk,deaths_sample);
    if abs(R(2,1)) > r
        r = R(2,1);
        tt = t;
    end
end
t_delay(1) = tt;
r_pearson(1) = r;

%Austria
r =0;
tt = NaN;
for t=-20:20
    deaths_sample = total_deaths_au(50+t:150+t)/sum(total_deaths_au(50+t:150+t));
    R = corrcoef(normalised_cases_austria,deaths_sample);
    if abs(R(2,1)) > r
        r = R(2,1);
        tt = t;
    end
end
t_delay(2) = tt;
r_pearson(2) = r;

%Denmark -> there is no delay here, t=0;
% r =0;
% tt = NaN;
% for t=-20:20
%     deaths_sample = total_deaths_den(64+t:200+t)/sum(total_deaths_den(64+t:200+t));
%     R = corrcoef(normalised_cases_denmark,deaths_sample);
%     if abs(R(2,1)) > r
%         r = R(2,1);
%         tt = t;
%     end
% end
% t_delay(3) = tt;
% r_pearson(3) = r;

%Belgium
r =0;
tt = NaN;
for t=-20:20
    deaths_sample = total_deaths_bel(60+t:170+t)/sum(total_deaths_bel(60+t:170+t));
    R = corrcoef(normalised_cases_belgium,deaths_sample);
    if abs(R(2,1)) > r
        r = R(2,1);
        tt = t;
    end
end
t_delay(3) = tt;
r_pearson(3) = r;

%France
r =0;
tt = NaN;
for t=-20:20
    deaths_sample = total_deaths_fr(58+t:150+t)/sum(total_deaths_uk(58+t:150+t));
    R = corrcoef(normalised_cases_france,deaths_sample);
    if abs(R(2,1)) > r
        r = R(2,1);
        tt = t;
    end
end
t_delay(4) = tt;
r_pearson(4) = r;

%Greece
r =0;
tt = NaN;
for t=-20:20
    deaths_sample = total_deaths_gr(58+t:150+t)/sum(total_deaths_gr(58+t:150+t));
    R = corrcoef(normalised_cases_greece,deaths_sample);
    if abs(R(2,1)) > r
        r = R(2,1);
        tt = t;
    end
end
t_delay(5) = tt;
r_pearson(5) = r;

%Ireland
r =0;
tt = NaN;
for t=-20:20
    deaths_sample = total_deaths_ir(59+t:184+t)/sum(total_deaths_gr(59+t:184+t));
    R = corrcoef(normalised_cases_ireland,deaths_sample);
    if abs(R(2,1)) > r
        r = R(2,1);
        tt = t;
    end
end
t_delay(6) = tt;
r_pearson(6) = r;

disp("The delay between cases and deaths for each country is (in days):");
disp(t_delay)
%This approach seams to prove that there is a delay between the cases and
%the deaths. The array t_delay shows the delay t when we have the maximum
%corelation between the two samples. In all 6 countries, t is either 0, in UK
%which means that the cases and deaths progress at the same time, and
%everywhere else
%positive. This is not in accordance with Executive 3, where we found that
%in many countries, the day with the maximum number of deaths proceeds the
%day with the maximun number of cases. This can be explained with three
%points. Firstly, in Eecutive 3 we just examined the day with the maxumum
%outcome, a factor much more random that the progress of the case/death
%waves, which we evaluated here. Furthermore, as you can see in this
%executive, we had to re-define the wave for the deaths to be in accordance
%with the wave of the cases, so that we can declare properly the pearson
%corelation. Finally, we cannot forget, that in Executive 3 we worked with
%the best fitting distribution, while here, in Executive 4 we worked
%directly with the samples received from the COVID-19 Database.
%Another interesting thing that we can comment, is the pearson factor. The
%numbers stored in vector r_pearson indicate that only UK has a strong
%corelation between the cases and the deaths,with Belgium (r=0.8866) being
%really close to this category as well. In the remaining countries we
%definately cannot say that they are not releated at all, since all values
%are not close to 0, but on the other hand, they are not 0.9 or higher.