%Efstathios Dimitriadis 8490
%Emmanouil Mylonas 9508
%This function compares the UK's fitting distribution for the sample of the
%other countries and returns the difference, using LSE.

function [diff] = Group24Exe2Fun2(data, distr)
    days = 1:length(data);
    P = fitdist(days', distr);
    y = pdf(P, days);

    diff = 0;

    for i = 1:length(days)
        diff = diff + (data(i) - y(i))^2;
    end

    diff = diff / length(days);
end
