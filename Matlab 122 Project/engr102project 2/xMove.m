function xMove(obj, addx)
% function to move an object in the x direction by addx pixels
% addx may be positive or negative

try
  set(obj, 'xData', get(obj, 'xData') + addx)
catch
end

