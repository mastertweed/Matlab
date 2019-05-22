function f = createWindow(w, h)
% createWindow(w, h)
% function to create a window whose width is w pixels and
% whose height is h pixels; its bottom left corner is placed
% 50 pixels up and 50 pixels to the right of the bottom left
% corner of the monitor
% (note: the function returns a handle to the window, if needed;
%  usange would then need to be  f=createWindow(w,h)

left = 50;
bottom = 50;
pos = [left bottom w h];
f = figure;
set (f, 'Position', pos)
set (f, 'MenuBar', 'none')
set (f, 'Name', 'EG 112')

x = [0 w];
y = [0 h];
hold on
axis equal
axis ([x y])

