%alternative solution for executive 2. It will be combined with Fun2. Not
%final yet

c = 'Confirmed Cases';
d = 'Confirmed Deaths';

Countries = ['Austria', 'Belgium', 'Denmark','France'];
for i=1:length(Countries)
    [cases,deaths] = Group24Exe2Fun2(Countries(i));
    Group24Exe2Fun2(cases,Countries(i),c)
    Group24Exe2Fun2(deaths,Countries(i),d)
end