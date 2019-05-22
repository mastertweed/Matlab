function approx = cosineApprox(x,n)
n = 2:2:n;
vec = [1,(x.^n)./(factorial(n))];
m = 1:numel(vec);
vec = vec.*(-1).^(m-1);
approx = sum(vec);

end

