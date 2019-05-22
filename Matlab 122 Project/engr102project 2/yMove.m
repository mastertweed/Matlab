function yMove(obj, addy)
% function to move an object in the y direction by addy pixels
% addy may be positive or negative

try
  set(obj, 'yData', get(obj, 'yData') + addy)
catch
end

