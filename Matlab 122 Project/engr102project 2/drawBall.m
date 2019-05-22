function b = drawBall(xc, yc, rad, col)
% b = drawBall(xc, yc, rad)
% function to draw a ball (filled circle), centered at (xc, yc) pixels
% and with a radius of rad pixels
% returns a handle to the ball
% the default color is blue. to specify another color, have its code or RGB value
% as a 4th argument. examples:
%   b = drawBall(40, 50, 10, 'r');          (for a red ball)
%   b = drawBall(70, 30, 25, [.8 .4 .23]);  (the color formed by those RGB percentages)

i = sqrt(-1);
c = plot(exp(i*[0:pi/100:2*pi])*rad + xc + yc*i);

xd = get(c, 'xdata');
yd = get(c, 'ydata');

set(c, 'Visible', 'off');

b = fill(xd, yd, 'blue');
set(b, 'Erase', 'xor')
set(b, 'Linewidth', 1)

if nargin == 4
  set(b, 'FaceColor', col);
end

