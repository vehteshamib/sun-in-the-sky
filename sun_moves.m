clear all
close all
clc

syms q1 q2 q3 q4 q5 q6 real

direction = [1; 0; 0];
T_Sun2Earth = [cos(q1) 0 -sin(q1); 0 1 0; sin(q1) 0 cos(q1)];
T_DayOfYear = [cos(q2) sin(q2) 0; -sin(q2) cos(q2) 0; 0 0 1];
T_TimeOfDay = [cos(q3) sin(q3) 0; -sin(q3) cos(q3) 0; 0 0 1];
T_Longitude = [cos(q4) sin(q4) 0; -sin(q4) cos(q4) 0; 0 0 1];
T_Latitude  = [cos(q5) 0 -sin(q5); 0 1 0; sin(q5) 0 cos(q5)];

SUN = simplify(T_Latitude*T_Longitude*T_TimeOfDay*T_Sun2Earth*T_DayOfYear*direction);