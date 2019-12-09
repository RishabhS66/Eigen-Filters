function[] = PlotGraphs(omega, Hr)
%Plotting the filters
figure;
k=size(Hr);
colsize=k(1,2);
hold on
for i=1:colsize
    plot(omega/pi,Hr(:,i))
end
% plot(omega/pi,Hr);
title('Eigen Filter Aplitude Responses');
xlabel('Frequency');
ylabel('Amplitude');
yline(0.05,'--');
yline(1.05,'--');
yline(-0.05,'--');
yline(0.95,'--');
yline(0);
yline(1);
xline(0.3,'--');
xline(0.4,'--');
xticks([0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1]);
xticklabels({'0','0.1\pi','0.2\pi','0.3\pi','0.4\pi','0.5\pi','0.6pi','0.7\pi','0.8\pi','0.9\pi','\pi'});
yticks([-0.05 0 0.05 0.95 1 1.05]);
legend('M=15','M=19','M=23','M=27','M=33');