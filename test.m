clear
clc

dt = 0.1;
t = 0:dt:100;

puma560 = Robot([jointClass(90, 0, 0, -180, 180, 0, 0, 0, "revolute", 13.0), jointClass(0, 431.8, 0, -170, 165, 0, 0, 0, "revolute", 17.4),...
                 jointClass(-90, 20.3, 125.4, -160, 150, 0, 0, 0, "revolute", 4.80), jointClass(90, 0, 431.8, -180, 180, 0, 0, 0, "revolute", 0.82),...
                 jointClass(-90, 0, 0, -10, 100, 0, 0, 0, "revolute", 0.35), jointClass(0, 0, 56.25, -180, 180, 0, 0, 0, "revolute", 0.09)]);

% puma560.joints(1).theta_i = 5;
% puma560.joints(2).theta_i = 120;
% puma560.joints(3).theta_i = 100;
% puma560.joints(4).theta_i = 150;
% puma560.joints(5).theta_i = 10;
% puma560.joints(6).theta_i = 90;


T = puma560.getT()
q = puma560.getq()
K = puma560.getK()
J = puma560.getJacobian()




        % a = 0;
        % alpha = 0; 
        % d = 0;
        % theta = 0;
        % tau = 0;
        % f = 0;