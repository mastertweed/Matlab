% animation_ae227.m - a program which will simulate collision of ball.

% Kushal Dave
% May 8, 2014
% Final Project

% Clearing all workspace commandwindow and closing all figures
clear all
clc
close all

% Defining variables
% Representing width of Window by w and Height by h in pixels
w = input('Enter the width for the window: ');  %  pixels
h= input('Enter the height for the window: ');  %  pixels

% Recalling the function which creates/generates the window.
f=createWindow(w,h);

ballRadius=10000000;
while (ballRadius>=w || ballRadius>=h) || fix((w-4)/(2*(ballRadius+2))) <= 0
    % Allowing user to select the radius of the ball.
    ballRadius = input('Enter the ball radius: ');
end

n=1000000;
fprintf('Max allowed number of balls: %d \n',fix((w-4)/(2*(ballRadius+2))))
while n>fix((w-4)/(2*(ballRadius+2)))
    % Asking the user for number of balls to appear on the window be represented as n
    n=input('Enter the number of balls: ');
end

nc=0;
while nc==0
    nc = input('Enter number of colors: ');
end

%Create a vector of ones for the Ball cordinates and the ball
x=ones(1,n);
y=ones(1,n);
b=ones(1,n);

% evenly x-spaced balls
x = 2 + ballRadius * (1:2:n*2);

for i=1:n
    y(i) = ballRadius+randi(h-2*ballRadius,1);
    %     %drawing the ball using the function b = drawBall(xc, yc, rad, col) where
    %     %the function name drawBall, its output which is the ball is b and inputs
    %     %are x,y coordinates, ball radius and ball color
    b(i)=drawBall(x(i),y(i),ballRadius);
    fprintf('Ball %d drawn\n',i);
end

%The next step is to carry out the animation of the ball within the defined
%window. Creating an infinite while loop so that the ball keeps moving and
%bouncing around the window. I will use a for loop to store it in vector
%format. so that each ball animation is carried out.
addx=ones(1,n); %Create a vector of ones for the movement in the x-position
addy=ones(1,n); %Create a vector of ones for the movement in the y-position

% alternate balls move different directions
% for i=1:2:n
%     addx(i)=-addx(i);
% end

% colors
cmap = hsv(nc);
while(1) %Infinite while loop
    for i=1:n %Creating a for loop so it reads each ball
        [x(i), y(i)] = getCenter(b(i)); %A function which tracks the center position of the ball
        if x(i)>=(w-ballRadius) || x(i)<=(ballRadius+0)
            addx(i)=-addx(i);
            addy(i)=addy(i);
        elseif y(i)>=(h-ballRadius) || y(i)<=(ballRadius+0)
            addx(i)=addx(i);
            addy(i)=-addy(i);
        end %of the conditional loop
        xMove(b(i),addx(i)) %moves the ball one pixel left or right horizonally
        yMove(b(i),addy(i)) %moves the ball one pixel up or down vertically
        [x(i), y(i)] = getCenter(b(i)); %A function which tracks the center position of the ball
        % %        continue
    end
    [x(i), y(i)] = getCenter(b(i)); %A function which tracks the center position of the ball
    
    %Carrying out interaction among all the balls
    for j=1:n
        for k=j:n
            if j~=k
                %Carrying out both head on and orthogonal collision conditions
                dist = (x(j)-x(k))^2 + (y(j)-y(k))^2;
                dist2 = (x(j)+addx(j)-x(k)-addx(k))^2 + (y(j)+addy(j)-y(k)-addy(k))^2;
                
                %fprintf('  %.2f  %.2f ||  %.2f,%.2f   %.2f,%.2f ||  %d  %d\n',dist,dist2,x(j),y(j),x(k),y(k),j,k);
                if dist < (2*ballRadius)^2
                    fprintf('****small ????\n');
                end
                if dist <= (2*ballRadius)^2 ||  dist2 <= (2*ballRadius)^2
                    if abs(x(j) - x(k)) == abs(y(j) - y(k))
                        addx(j) = -addx(j);
                        addy(j) = -addy(j);
                        addx(k) = -addx(k);
                        addy(k) = -addy(k);
                        fprintf('Head on Collision occurred!\n');
                        set(b(j), 'FaceColor', cmap(randi(nc,1),:));
                        set(b(k), 'FaceColor', cmap(randi(nc,1),:));
                    elseif addy(j) == addy(k)
                        addx(j) = -addx(j);
                        addx(k) = -addx(k);
                        addy(j) = addy(j);
                        addy(k) = addy(k);
                        fprintf('Same Y dir Collision occurred!\n');
                        set(b(j), 'FaceColor', cmap(randi(nc,1),:));
                        set(b(k), 'FaceColor', cmap(randi(nc,1),:));
                    elseif addx(j) == addx(k)
                        addy(j) = -addy(j);
                        addy(k) = -addy(k);
                        addx(j) = addx(j);
                        addx(k) = addx(k);
                        fprintf('Same X dir Collision occurred!\n');
                        set(b(j), 'FaceColor', cmap(randi(nc,1),:));
                        set(b(k), 'FaceColor', cmap(randi(nc,1),:));
                    elseif (addx(j)>0 && addy(j)>0) && (addx(k)<0 && addy(k)<0)
                        if(x(k)-x(j)>sqrt(2)*ballRadius || abs(y(k)-y(j))<sqrt(2)*ballRadius)
                            addx(j) = -addx(j);
                            addx(k) = -addx(k);
                            addy(j) = addy(j);
                            addy(k) = addy(k);
                        elseif(x(k)-x(j)<sqrt(2)*ballRadius || y(k)-y(j)>sqrt(2)*ballRadius)
                            addy(j) = -addy(j);
                            addy(k) = -addy(k);
                            addx(j) = addx(j);
                            addx(k) = addx(k);
                        else
                            fprintf('Unknown1 Collision occurred! %d,%d   %d,%d  xdiff %.2f  ydiff %.2f  diag %.2f\n',addx(j),addy(j),addx(k),addy(k),abs(x(k)-x(j)),abs(y(k)-y(j)),sqrt(2)*ballRadius);
                        end
                        set(b(j), 'FaceColor', cmap(randi(nc,1),:));
                        set(b(k), 'FaceColor', cmap(randi(nc,1),:));
                        fprintf('Collision C1\n');
                    elseif (addx(j)<0 && addy(j)<0) && (addx(k)>0 && addy(k)>0)
                        if(x(j)-x(k)<sqrt(2)*ballRadius || y(j)-y(k)>sqrt(2)*ballRadius)
                            addy(j) = -addy(j);
                            addy(k) = -addy(k);
                            addx(j) = addx(j);
                            addx(k) = addx(k);
                        elseif(x(j)-x(k)>sqrt(2)*ballRadius || abs(y(k)-y(j))<sqrt(2)*ballRadius)
                            addx(j) = -addx(j);
                            addx(k) = -addx(k);
                            addy(j) = addy(j);
                            addy(k) = addy(k);
                        else
                            fprintf('Unknown2 Collision occurred! %d,%d   %d,%d  xdiff %.2f  ydiff %.2f  diag %.2f\n',addx(j),addy(j),addx(k),addy(k),abs(x(k)-x(j)),abs(y(k)-y(j)),sqrt(2)*ballRadius);
                        end
                        set(b(j), 'FaceColor', cmap(randi(nc,1),:));
                        set(b(k), 'FaceColor', cmap(randi(nc,1),:));
                        fprintf('Collision C2\n');
                    elseif (addx(j)>0 && addy(j)<0) && (addx(k)<0 && addy(k)>0)
                        if(x(k)-x(j)<sqrt(2)*ballRadius || y(j)-y(k)>sqrt(2)*ballRadius)
                            addy(j) = -addy(j);
                            addy(k) = -addy(k);
                            addx(j) = addx(j);
                            addx(k) = addx(k);
                        elseif(x(k)-x(j)>sqrt(2)*ballRadius || abs(y(k)-y(j))<sqrt(2)*ballRadius)
                            addx(j) = -addx(j);
                            addx(k) = -addx(k);
                            addy(j) = addy(j);
                            addy(k) = addy(k);
                        else
                            fprintf('Unknown3 Collision occurred! %d,%d   %d,%d  xdiff %.2f  ydiff %.2f  diag %.2f\n',addx(j),addy(j),addx(k),addy(k),abs(x(k)-x(j)),abs(y(k)-y(j)),sqrt(2)*ballRadius);
                        end
                        set(b(j), 'FaceColor', cmap(randi(nc,1),:));
                        set(b(k), 'FaceColor', cmap(randi(nc,1),:));
                        fprintf('Collision C3\n');
                    elseif (addx(j)<0 && addy(j)>0) && (addx(k)>0 && addy(k)<0)
                        if(x(k)-x(j)<sqrt(2)*ballRadius || y(k)-y(j)>sqrt(2)*ballRadius)
                            addy(j) = -addy(j);
                            addy(k) = -addy(k);
                            addx(j) = addx(j);
                            addx(k) = addx(k);
                        elseif(x(k)-x(j)>sqrt(2)*ballRadius || abs(y(k)-y(j))<sqrt(2)*ballRadius)
                            addx(j) = -addx(j);
                            addx(k) = -addx(k);
                            addy(j) = addy(j);
                            addy(k) = addy(k);
                        else
                            fprintf('Unknown4 Collision occurred! %d,%d   %d,%d  xdiff %.2f  ydiff %.2f  diag %.2f\n',addx(j),addy(j),addx(k),addy(k),abs(x(k)-x(j)),abs(y(k)-y(j)),sqrt(2)*ballRadius);
                        end
                        set(b(j), 'FaceColor', cmap(randi(nc,1),:));
                        set(b(k), 'FaceColor', cmap(randi(nc,1),:));
                        fprintf('Collision C4\n');
                    elseif(x(j)==x(k))
                        addy(j) = -addy(j);
                        addy(k) = -addy(k);
                        addx(j) = addx(j);
                        addx(k) = addx(k);
                        fprintf(' SAME X occurred!\n');
                        set(b(j), 'FaceColor', cmap(randi(nc,1),:));
                        set(b(k), 'FaceColor', cmap(randi(nc,1),:));
                    elseif(y(j)==y(k))
                        addx(j) = -addx(j);
                        addx(k) = -addx(k);
                        addy(j) = addy(j);
                        addy(k) = addy(k);
                        fprintf(' SAME Y occurred!\n');
                        set(b(j), 'FaceColor', cmap(randi(nc,1),:));
                        set(b(k), 'FaceColor', cmap(randi(nc,1),:));
                    else
                        fprintf('Mysterious Collision occurred! %d,%d   %d,%d\n',addx(j),addy(j),addx(k),addy(k));
                    end
                    if dist2 <= (2*ballRadius)^2
                        continue
                    end
                    xMove(b(j),addx(j)) %moves the ball one pixel left or right horizonally
                    yMove(b(j),addy(j)) %move the ball one pixel up or down vertically
                    [x(j), y(j)] = getCenter(b(j)); %A function which tracks the center position of the ball
                    xMove(b(k),addx(k)) %moves the ball one pixel left or right horizonally
                    yMove(b(k),addy(k)) %move the ball one pixel up or down vertically
                    [x(k), y(k)] = getCenter(b(k)); %A function which tracks the center position of the ball
                end
            end
        end
    end
    redraw %redraws the ball everytime a loop is completed
    pause(0.0000001) %indicates the ball speed
end %of the while loop

