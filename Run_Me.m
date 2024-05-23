clear all
close all
clc

Day_Number = 93
% Time = 10;
Longitude = 71.39;
Latitude = 33;

step = 0.0125;
set = 24;
daytimes=0;
for n = 1:(set/step)
    
    Time = -set/2 + (n-1)*step;
    
    q1 = 23.4*(pi/180);
    q2 = (Day_Number - 94)/365*2*pi;
    q3 = Time/24*2*pi;
    q4 = Longitude*pi/180;
    q5 = (90 - Latitude)*pi/180;
    
    SUN(n,:) = [- cos(q2)*(sin(q1)*sin(q5) - cos(q1)*(cos(q3)*cos(q4)*cos(q5) - cos(q5)*sin(q3)*sin(q4))) - sin(q2)*(cos(q3)*cos(q5)*sin(q4) + cos(q4)*cos(q5)*sin(q3))
        - cos(q3 + q4)*sin(q2) - sin(q3 + q4)*cos(q1)*cos(q2)
        cos(q2)*(cos(q5)*sin(q1) - cos(q1)*(sin(q3)*sin(q4)*sin(q5) - cos(q3)*cos(q4)*sin(q5))) - sin(q2)*(cos(q3)*sin(q4)*sin(q5) + cos(q4)*sin(q3)*sin(q5))]';
    
    r = (SUN(n,1)^2 + SUN(n,2)^2)^0.5;
    if SUN(n,3)>=0
    SUN_PLOT(n,:) = [-r*SUN(n,1) r*SUN(n,2)];
    daytimes=daytimes +1;
    else
    SUN_PLOT(n,:) = [0 0];    
    end
    
end

figure
box on
axis equal
plot(SUN_PLOT(:,2),SUN_PLOT(:,1),'r.')
hold on
t = 0:0.001:2*pi;
plot(cos(t),sin(t),'b-')
Day_duration=daytimes*step