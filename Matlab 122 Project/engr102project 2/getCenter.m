function [x, y] = getCenter(b)
% function that returns the center of an object 
% (such as a circle's center's coordinates).

try
  xd = get(b, 'xData');
  yd = get(b, 'yData');
  x = ( min(xd) + max(xd) ) / 2;
  y = ( min(yd) + max(yd) ) / 2;
  x = round(x);
  y = round(y);
catch
 disp('bye');
end

