clc; clear all; close all;

travel=[0 1 2 3 4 5 6 7];
BS_70_force=[0 389 680 990 1382 1959 2987 5046];
BS_80_force=[0 497 920 1423 2065 2963 4409 7133];
BS_71_force=[0 223 430 651 919 1297 1939 3295];

figure (1)
subplot(2,3,2)
plot(travel,BS_70_force)
hold on
plot(travel,BS_80_force)
plot(travel,BS_71_force)
legend('70','80','71')

p_70=polyfit(travel,BS_70_force,4)
p_80=polyfit(travel,BS_80_force,4)
p_71=polyfit(travel,BS_71_force,4)

for i=1:length(travel)
    
    BS_70_fit(i)= p_70(1)*travel(i)^4 + p_70(2)*travel(i)^3 + p_70(3)*travel(i)^2 + p_70(4)*travel(i) + p_70(5);
    BS_80_fit(i)= p_80(1)*travel(i)^4 + p_80(2)*travel(i)^3 + p_80(3)*travel(i)^2 + p_80(4)*travel(i) + p_80(5);
    BS_71_fit(i)= p_71(1)*travel(i)^4 + p_71(2)*travel(i)^3 + p_71(3)*travel(i)^2 + p_71(4)*travel(i) + p_71(5);
    
end

figure(1)
subplot(2,3,4)
plot(travel,BS_70_force)
hold on
plot(travel,BS_70_fit)
title('BS 70')

subplot(2,3,5)
plot(travel,BS_80_force)
hold on
plot(travel,BS_80_fit)
title('BS 80')

subplot(2,3,6)
plot(travel,BS_71_force)
hold on
plot(travel,BS_71_fit)
title('BS 71')

f_70 = polyval(p_70,travel);
T_70 = table(travel',BS_70_force',BS_70_fit',((BS_70_force-BS_70_fit)./BS_70_force*100)','VariableNames',{'X','Y','Fit','FitError %'})

f_80 = polyval(p_80,travel);
T_80 = table(travel',BS_80_force',BS_80_fit',((BS_80_force-BS_80_fit)./BS_80_force*100)','VariableNames',{'X','Y','Fit','FitError %'})

f_71 = polyval(p_71,travel);
T_71 = table(travel',BS_71_force',BS_71_fit',((BS_71_force-BS_71_fit)./BS_71_force*100)','VariableNames',{'X','Y','Fit','FitError %'})

