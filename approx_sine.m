function [approx, terms] = approx_sine(x, threshold)
approx = x; % Initial approximation 
terms = 0;% Number of additional terms added to improve the approximation
true = sin(x); %Initialize true as the built in sine function
    while (abs((true-approx)/true) > threshold) %Repeat until threshold met
          approx = approx + (((-1)^(terms+1)) * (x^(2*terms+3)))/factorial(2*terms+3); %Add the the approximaiton
          terms = terms+1; %Add one to the term counter
    end
end