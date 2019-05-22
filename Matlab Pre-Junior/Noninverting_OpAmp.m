% B0_array = table2array(B0);
% B1_array = table2array(B1);
% B2_array = table2array(B2);

% B1_array = table2array(betaHALF(:,6:);
% B2_array = table2array(betaONE);
% B0_array = table2array(betaZERO);

plot(B0_array(:,4),B1_array(:,4),B2_array(:,4),B2_array(:,2),'--')
legend('B = 0.0','B = 0.5','B = 1.0','Vin')
title('Vout for 10K Potentiometer Values')
xlabel('Time')
ylabel('Voltage (V)')