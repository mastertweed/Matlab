data = table2array(a);

max_data = max(data);
t = linspace(0,max_data,100);
pdf = ksdensity(data)';
cdf = cumsum(pdf)./max_data';
pdf = pdf/cdf(end);
cdf = cdf/cdf(end);

max_pdf = find(max(pdf)==pdf);
% m = sum((t*cdf)*(max_data/100));
mean_pdf = mean(pdf);
variance = mean_pdf^2;

figure
plot(t',pdf,t(max_pdf)',max(pdf),'*',t(22),mean(pdf),'o')
legend('Probability Density Function','Peak Value = 1.1991','Mean Value')

disp('Variance of the Density')
disp(variance);

figure 
plot(t',cdf)
legend('Cummulative Distribution Function')

figure
histogram(data);
legend('Probability Density Function')
