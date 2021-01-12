%ignore
X = randn(10,100);
low = zeros(1,100);
high = zeros(1,100);
low2 = zeros(1,100);
high2 = zeros(1,100); 

for i = 1:100
    [~,~,ci] = ttest(X(:,i));
    low(i) = ci(1);
    high(i) = ci(2);
    ci2 = bootci(100,@mean,X(:,i));
    low2 = ci2(1);
    high2 = ci2(2);
end
figure(1)
title('low')
histogram(low)

figure(2)
title('high')
histogram(high)

figure(3)
title('low bootstramp')
histogram(low2)

figure(4)
title('high bpptstramp')
histogram(high2)