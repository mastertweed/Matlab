%animate.m - a program which carrires out animation of moving/bouncing
%balls inside a defined window

%Pratik Bhardwaj
%December 2, 2014
%AE 227 Final Project

clear all %Clears the workspace
close all %Closes all the open figure windows.
clc %Clears the command window

%Variables Used-
%let the width be represented as w and the height be represented as h of
%a window in pixels
w = input('Enter the width for the window: ');%pixels
h= input('Enter the height for the window: ');%pixels
%calling the function which creates/generates the window. f is the output
%of the window which shows the number of windows generated. createWindow is
%the name of the function and w and h are the inputs.
f=createWindow(w,h);
%let the number of balls to appear on the window be represented as n
n=input('Enter the number of balls: ');
%let the radius of the ball be defined using the following variable
ballRadius = input('Enter the ball radius: ');
%Create a vector of ones for the Ball cordinates and the ball
x=ones(1,n);
y=ones(1,n);
b=ones(1,n);
for i=1:n
    fprintf('Ball %d\n',i) %Printing out the ball number till it gets to n
    %We need to enter the x and y co-ordinates of the balls defined
    x(i) = input('Enter the x-coordinate for the ball: ');
    y(i)= input('Enter the y-coordinate for the ball: ');
    %drawing the ball using the function b = drawBall(xc, yc, rad, col) where
    %the function name drawBall, its output which is the ball is b and inputs
    %are x,y coordinates, ball radius and ball color
    b(i)=drawBall(x(i),y(i),ballRadius);
end

%The next step is to carry out the animation of the ball within the defined
%window. Creating an infinite while loop so that the ball keeps moving and
%bouncing around the window.
addx=ones(1,n); %Create a vector for the movement in the x-position
addy=ones(1,n); %Create a vector for the movement in the y-position

while(1) %Infinite while loop
    for i=1:n %Creating a for loop so it reads each ball
        xMove(b(i),addx(i)) %moves the ball one pixel left or right horizonally
        yMove(b(i),addy(i)) %moves the ball one pixel up or down vertically
        [x(i), y(i)] = getCenter(b(i)); %A function which tracks the center position of the ball
            if x(i)>=(w-ballRadius)
                addx(i)=-1;
            elseif y(i)>=(h-ballRadius)
                addy(i)=-1;
            elseif x(i)<=(ballRadius+0)
                addx(i)=1;
            elseif y(i)<=(ballRadius+0)
                addy(i)=1;
            end %of the conditional loop
    end
    %Carrying out interaction among all the balls
    for j=1:n-1
        for k=1:n
            %Carrying out both head on and orthogonal collision conditions
            dist = sqrt((x(j)-x(k))^2 + (y(j)-y(k))^2);
            if dist <=(2*ballRadius) && dist>0
                addx(j) = -addx(j);
                addy(j) = -addy(j);
                addx(k) = -addx(k);
                addy(k) = -addy(k);
                    if (x(j) == x(k))
                        addx(j) = -addx(j);
                        addx(k) = -addx(k);
                    elseif (y(j) == y(k))
                        addy(j) = -addy(j);
                        addy(k) = -addy(k);
                    end
                xMove(b(j),addx(j)) %moves the ball one pixel left or right horizonally
                yMove(b(j),addy(j)) %move the ball one pixel up or down vertically
                [x(j), y(j)] = getCenter(b(j)); %A function which tracks the center position of the ball
                xMove(b(k),addx(k)) %moves the ball one pixel left or right horizonally
                yMove(b(k),addy(k)) %move the ball one pixel up or down vertically
                [x(k), y(k)] = getCenter(b(k)); %A function which tracks the center position of the ball
               
                fprintf('Collision occurred! at\nx: First Ball  = %d, x: 2nd Ball  = %d\ny: First Ball  = %d, y: 2nd Ball  = %d\n\n',x(j),x(k),y(j),y(k))
              
            end
        end
    end
    redraw %redraws the ball everytime a loop is completed
    pause(0.01) %indicates the ball speed
end %of the while loop


