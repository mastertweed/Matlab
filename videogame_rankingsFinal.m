function [removed,Xmean,Xstd,Y,textfile] = videogame_rankings(X)
% Open Read/Write capable Text file
fid = fopen('output.txt','w+');
% Do not modify above this line.

original = length(X(1,:));

while any(X(2,:) == 1);     %Check the second row for one's 
    a = find(X(2,:) == 1);  %Find where the second row equals one
    X(1,a) = X(1,a)+5;      %Add 5 to that players score
    X(2,a) = 0;             %Set bonus to 0
end
while any(X(3,:) == 1);     %Check the third row for one's 
    b = find(X(3,:) == 1);  %Find where the third row equals one
    X(1,b) = X(1,b)-5;      %Subtract 5 to that players score
    X(3,b) = 0;             %Set penalty to 0
end
while any(X(3,:) == 2);     %Check the third row for two's 
    c = (X(3,:) == 2);      %Find where the third row equals two
    X(:,c) = [];            %Eliminate that coloum
end

removed = original-length(X(1,:));
fprintf(fid,'Out of the original %d players, %d remain.\n',original,length(X));
sum = 0;
for k = 1:length(X(1,:));   %Repeat for every element in vector X
    sum = sum + (X(1,k));   %Add score to sum 
end
Xmean = sum/length(X(1,:)); %Calculate mean using sum and length of vector X
variance = 0;
for k = 1:length(X(1,:));
    variance = variance + ((X(1,k)-Xmean).^2); %Add the value minus the mean squared 
end

variance = variance/(length(X(1,:))-1);              %Find the variance
Xstd = sqrt(variance);                               %Find the standard deviation of the scores
formatSpec = 'The mean of the scores is %.3f,';
fprintf(fid,formatSpec,Xmean);                       %Write and display the Mean 
formatSpec = ' the standard deviation is %.3f.\n';
fprintf(fid,formatSpec,Xstd);                        %Write and display the standard deviation

tier1 = Xmean+((4/3)*Xstd);             %Initialize the tier 1 range
tier2 = Xmean+((1/3)*Xstd);             %Initialize the tier 2 range
tier3 = Xmean-((1/3)*Xstd);             %Initialize the tier 3 range
tier4 = Xmean-((4/3)*Xstd);             %Initialize the tier 4 range 

T = zeros(1,length(X));                 %Create a vector for player tiers
numtiers = zeros(1,5);                  %Create a vector to count the players within each tier

for i = 1:length(X);                    %Repeat for each player 
    if (X(1,i) >= tier1);               %Check score for tier 1 specifications
        T(i) = 1;                       %Set player rank to tier 1 
        numtiers(1) = numtiers(1) + 1;  %Add one to tier 1 counter
    elseif (X(1,i) >= tier2);           %Check score for tier 2 specifications
        T(i) = 2;                       %Set player rank to tier 2
        numtiers(2) = numtiers(2) + 1;  %Add one to tier 1 counter
    elseif (X(1,i) >= tier3);           %Check score for tier 3 specifications
        T(i) = 3;                       %Set player rank to tier 3
        numtiers(3) = numtiers(3) + 1;  %Add one to tier 1 counter
    elseif (X(1,i) >= tier4);           %Check score for tier 4 specifications
        T(i) = 4;                       %Set player rank to tier 1
        numtiers(4) = numtiers(4) + 1;   %Add one to tier 1 counter
    else 
        T(i) = 5;                       %Set player rank to tier 1
        numtiers(5) = numtiers(5) + 1;  %Add one to tier 1 counter
    end
end

Y = [X(1,:);T];                         %Create vector with scores as row 1 and tiers row 2 

fprintf(fid,'The number of players in each tier is as follows:\n');  %Wite and print the "The number of players in each tier is as follows:"

for i = 1:5                    %Repeat five times
    if numtiers(i) == 1        %Check if tier has only 1 player
        endLetter = '';        %Dont make player plural
        endLetter = 's';       %Make player plural "players"
    end
   fprintf(fid, 'Tier %d: %d player%s\n',i,numtiers(i),endLetter);   %Write and print tier number with number of players in it 
end

% Do not modify below this line.
fclose(fid); % Close text file
textfile = fileread('output.txt'); % Save file as a string

end

