%HW6
%GB comments
1a 100
1b 100
1c 100
1d 100
1e 100
2a 100
2b 100
2c 100
Overall: 100

% Problem 1. Curve fitting. 
% Part 1. Take 10 x values on the interval 0 < x <= 10 and then create y
% values from the x values by plugging the x values into a third order
% polynomial of your choice. Add random noise to the data by choosing a random number
% in the interval [-D, D]. Start with D = 1. Plot your data in the x-y plane.

xx = sort(1 + (10-1)*rand(10,1));

yy = 6*xx.^3 - 5*xx.^2 + 3*xx + 1 + (-1 + (1-(-1))*rand(1,1));

plot(xx, yy, 'r.', 'MarkerSize', 24);

% Part 2. Fit your data with polynomials from order 1 to 9. Plot the fitted
% polynomials together with the data.

for i = 1:9
    plot(xx, yy, 'r.', 'MarkerSize', 24);
    [coeff, s] = polyfit(xx, yy,i);
    hold on;
    plot(xx, polyval(coeff, xx), 'LineWidth',3);
end
hold off;

% Part 3. On a separate plot, plot the R^2 and adjusted R^2 as a function
% of the order of the polynomial. 
r=[]
r_adj=[]
for i = 1:9
    [fit_out, properties]=fit(xx, yy, strcat('poly', num2str(i)));
    r=[r;properties.rsquare];
    r_adj=[r_adj;properties.adjrsquare];
end

plot(1:9, r, 'LineWidth', 1, 'DisplayName', 'R^2');hold on;
plot(1:9, r_adj, 'LineWidth', 1, 'DisplayName', 'adj R^2');
hold off;
legend('show');


% Part 4. Repeat parts 1 - 3 for D = 10 and D = 1000. Comment on the
% results. 

%D=10
yy = 6*xx.^3 - 5*xx.^2 + 3*xx + 1 + (-1 + (1-(-1))*rand(10,1));

plot(xx, yy, 'r.', 'MarkerSize', 24);

for i = 1:9
    plot(xx, yy, 'r.', 'MarkerSize', 24);
    [coeff, s] = polyfit(xx, yy,i);
    hold on;
    plot(xx, polyval(coeff, xx), 'LineWidth',3);
end
hold off;

r=[]
r_adj=[]
for i = 1:9
    [fit_out, properties]=fit(xx, yy, strcat('poly', num2str(i)));
    r=[r;properties.rsquare];
    r_adj=[r_adj;properties.adjrsquare];
end

plot(1:9, r, 'LineWidth', 1, 'DisplayName', 'R^2');hold on;
plot(1:9, r_adj, 'LineWidth', 1, 'DisplayName', 'adj R^2');
hold off;
legend('show');

%D=100
yy = 6*xx.^3 - 5*xx.^2 + 3*xx + 1 + (-1 + (1-(-1))*rand(100,1));

plot(xx, yy, 'r.', 'MarkerSize', 24);

for i = 1:9
    plot(xx, yy, 'r.', 'MarkerSize', 24);
    [coeff, s] = polyfit(xx, yy,i);
    hold on;
    plot(xx, polyval(coeff, xx), 'LineWidth',3);
end
hold off;

r=[]
r_adj=[]
for i = 1:9
    [fit_out, properties]=fit(xx, yy, strcat('poly', num2str(i)));
    r=[r;properties.rsquare];
    r_adj=[r_adj;properties.adjrsquare];
end

plot(1:9, r, 'LineWidth', 1, 'DisplayName', 'R^2');hold on;
plot(1:9, r_adj, 'LineWidth', 1, 'DisplayName', 'adj R^2');
hold off;
legend('show');

%The r square value decreases as the noise increases, and the best fit is
%at the third degree polynomial. It appears that fits beyond the third
%degree polynomial are overfit.


% Part 5. Now repeat parts 1-3 but take 100 x values on the interval 0 < x <=
% 10. Comment on the results. 

xx = sort(1 + (10-1)*rand(100,1));

yy = 6*xx.^3 - 5*xx.^2 + 3*xx + 1 + (-1 + (1-(-1))*rand(1,1));

plot(xx, yy, 'r.', 'MarkerSize', 24);

for i = 1:9
    plot(xx, yy, 'r.', 'MarkerSize', 24);
    [coeff, s] = polyfit(xx, yy,i);
    hold on;
    plot(xx, polyval(coeff, xx), 'LineWidth',3);
end
hold off;

r=[]
r_adj=[]
for i = 1:9
    [fit_out, properties]=fit(xx, yy, strcat('poly', num2str(i)));
    r=[r;properties.rsquare];
    r_adj=[r_adj;properties.adjrsquare];
end

plot(1:9, r, 'LineWidth', 1, 'DisplayName', 'R^2');hold on;
plot(1:9, r_adj, 'LineWidth', 1, 'DisplayName', 'adj R^2');
hold off;
legend('show');

%the adjusted r square value is nearly the same as the r square value, as
%with more values, we would expect a better fit and thus r square values
%that are more robust.


% Problem 2. Basic statistics. 
% Part 1. Consider two different distributions - Gaussian numbers with a mean of
% 0 and variance 1 and Gaussian numbers with a mean of 1 and variance 1.



% (1) Make a plot of the average p-value for the t-test comparing N random
% numbers chosen from each of these two distributions as a function of N.



for n=1:100
    dist1=randn(n,1);
    dist2=1+randn(n,1);
    [sig, pval]=ttest(dist1, dist2);
    if isnan(pval)
        mean_p(n) = 1;
        mean_p(n) = mean(mean_p);
    else
        mean_p(n)=pval;
        mean_p(n) = mean(mean_p);
    end
end

plot(1:100, mean_p, 'LineWidth', 1);
title('Average p-Value as a Function of Sample Size');
xlabel('Sample Size');
ylabel('p-value');

% Part 2. Now keep the first distribution the same, but vary the mean of
% the second distribution between 0 and 10 with the same variance and
% repeat part one. Make a plot of all of these different curves on the same
% set of axes. What is special about the case where the mean of the second
% distribution is 0? 


for i=0:10
    for n=1:100
        dist1=randn(n,1);
        dist2=i+randn(n,1);
        [sig, pval]=ttest(dist1, dist2);
        if isnan(pval)
            mean_p(n) = 1;
            mean_p(n) = mean(mean_p);
        else
            mean_p(n)=pval;
            mean_p(n) = mean(mean_p);
        end
    end
 plot(1:100, mean_p, 'LineWidth', 1, 'DisplayName', strcat('mean', num2str(i))); hold on; 
end

xlabel('Sample Size');
ylabel('p-value');
legend('show');

%when looking at the p values, it makes sense that with a mean of 0, the
%pvalues are not significant since we would expect no difference between
%the distributions as the sample size increases.

% Part 3. Now keep the means of the two distributions at 0 and 1 as in part
% 1, but vary the variance of both distributions simultaneiously between 0.1 and 10 and plot the 
% p-values vs the number of numbers drawn as before. Comment on your results.  

for i=0.1:0.7:10
    for n=1:100
        dist1=i^2.*randn(n,1);
        dist2=i^2.*randn(n,1)+1;
        [sig, pval]=ttest(dist1, dist2);
        if isnan(pval)
            mean_p(n) = 1;
            mean_p(n) = mean(mean_p);
        else
            mean_p(n)=pval;
            mean_p(n) = mean(mean_p);
        end
    end
 plot(1:100, mean_p, 'LineWidth', 1, 'DisplayName', strcat('var', num2str(i))); hold on; 
end

xlabel('Sample Size');
ylabel('p-value');
legend('show');

%as you can see, the p-values vary in a random fashion with increasing
%variance. Variance values that were under 1, demonstrate a linearly
%decreasing pvalue, which beyond that level of variance appears more
%random.
