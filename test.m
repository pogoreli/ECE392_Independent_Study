clear
clc

dt = 0.1;
t = 0:dt:100;

robot = Robot();
robot.joints = [jointClass(), jointClass(), jointClass(), jointClass()];

% robot.joints(2).theta_i = 5 + 0.001*t;
% robot.joints(2).d_i = 10 + 0.001*t;
% robot.joints(2).a_i = 0.01 + 0.001*t;
% robot.joints(2).alpha_i = (pi / 2)  + 0.001*t;
% 
% robot.joints(3).theta_i = 7 + 0.001*t;
% robot.joints(3).d_i = 3 + 0.001*t;
% robot.joints(3).a_i = 0.1 + 0.001*t;
% robot.joints(3).alpha_i = (pi / 2) + 0.001*t;

robot.joints(2).theta_i = 5;
robot.joints(2).d_i = 10;
robot.joints(2).a_i = 0.01;
robot.joints(2).alpha_i = (pi / 2);

robot.joints(3).theta_i = 7;
robot.joints(3).d_i = 3;
robot.joints(3).a_i = 0.1;
robot.joints(3).alpha_i = (pi / 2);

T = robot.getT()
q = robot.getq()
K = robot.getK()
J = robot.getJ()




        % a = 0;
        % alpha = 0; 
        % d = 0;
        % theta = 0;
        % tau = 0;
        % f = 0;