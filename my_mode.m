function [m] = my_mode(x)
a = sort(x);      %Create a new vector a by sorting the vector x numericaly 
b = diff(a);      %Create a new vector b by finding the differences between each term within a
c = find(b);      %Create a vector c with non zero indicies on b
d = diff(c);      %Create a vector d by finding the differences between each term within c
[~, y] = max(d);  %Initialize y as the index of the max value in d
y = y+1;          %Offset y by one
p = unique(x);    %Copy vector x to p with no repeated values 
m = p(y);         %Initialize m as the y'th value of vector p
end

