function [day_max] = Group24Exe3Fun1(sample)
    max_sample = 0;
    for i=1:length(sample)
        if max_sample<sample(i)
            max_sample = sample(i);
            day_max = i;
        end
    end
end

