no_target = table2array(abc(1:40,1));
target = table2array(abc(41:70,1));

figure
histogram(no_target,20), hold on 
histogram(target,20)
legend('No Target Detected','Target Detected')
hold off

no_target_den = ksdensity(no_target);
target_den = ksdensity(target);

figure 
plot(no_target_den), hold on
plot(target_den)
plot(58,no_target_den(58),'o')
legend('No Target Detected','Target Detected','Threshold = 5.8')

disp('Target Absent: 40')
disp('Target Absent prior P():')
disp(40/70)
disp('Target Present: 30')
disp('Target Present prior P():')
disp(30/70)

%% Threshold 5.8
falsealarm = length(find(no_target > 5.8));
miss = length(find(target < 5.8));
p_falsealarm = falsealarm/40;
p_miss = miss/30;

p_total = (1-p_miss)*(40/70)+(1-p_falsealarm)*(30/70);

PPV = (1-p_miss)*((40/70)/p_total);


a = sprintf('Threshold: 5.8\n');
c = sprintf('Sensitivity: %f\n',1-p_miss);
d = sprintf('Probability of False Alarm: %f\n',p_falsealarm);
e = sprintf('Specificity: %f\n',1-p_falsealarm);
f = sprintf('Probability of Miss: %f\n',p_miss);
g = sprintf('Total Probablity: %f\n',p_total);
h = sprintf('PPV: %f\n',PPV);

disp([a c d e f g])

%% Threshold 4.5
falsealarm = length(find(no_target > 4.5));
miss = length(find(target < 4.5));
p_falsealarm = falsealarm/40;
p_miss = miss/30;

p_total = (1-p_miss)*(40/70)+(1-p_falsealarm)*(30/70);

PPV = (1-p_miss)*((40/70)/p_total);


a = sprintf('Threshold: 4.5\n');
c = sprintf('Sensitivity: %f\n',1-p_miss);
d = sprintf('Probability of False Alarm: %f\n',p_falsealarm);
e = sprintf('Specificity: %f\n',1-p_falsealarm);
f = sprintf('Probability of Miss: %f\n',p_miss);
g = sprintf('Total Probablity: %f\n',p_total);
h = sprintf('PPV: %f\n',PPV);

disp([a c d e f g])