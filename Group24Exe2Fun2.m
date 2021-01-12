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
