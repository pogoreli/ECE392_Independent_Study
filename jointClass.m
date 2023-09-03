classdef jointClass
    properties
        a_i = 0; %The offset distance between the z(i-1) and z(i) axes along the x(i) axis
        alpha_i = 0; %the angle from the z(i-1) axis to the z(i) axis about the x(i) axis
        d_i = 0; %the distance from the origin of frame i-1 to the x(i) axis along the z(i-1) axis
        theta_i = 0; %the angle between the x(i-1) and x(i) axes about the z(i-1) axis

        %generalized forces
        tau_i = 0;
        f_i = 0;

        jointType = "revolute" %revolute or prismatic
    end


    methods
        % For a revolute joint θi is the joint variable and di is constant, while for a prismatic
        % joint di is variable, and θi is constant. In many of the formulations that follow we use
        % generalized coordinates, qi, where
        function q = getq_i(obj)
            if strcmpi(obj.jointType, "revolute")
                q = obj.theta_i;
            else
                q = obj.d_i;
            end
        end
    
        %generalized forces
        function Q = getQ_i(obj)
            if strcmpi(obj.jointType, "revolute")
                Q = obj.tau_i;
            else
                Q = obj.f_i;
            end
        end

        function A = getA_i(obj)
            A = [cos(obj.theta_i), (-sin(obj.theta_i) * cos(obj.alpha_i)), (sin(obj.theta_i) * sin(obj.alpha_i)), (obj.a_i * cos(obj.theta_i));...
                sin(obj.theta_i), (cos(obj.theta_i) * cos(obj.alpha_i)), (-cos(obj.theta_i) * sin(obj.alpha_i)), (obj.a_i * sin(obj.theta_i));...
                0, sin(obj.alpha_i), cos(obj.alpha_i), obj.d_i;...
                0, 0, 0, 1];
        end

        function T = getT_i(obj, varargin)
            if nargin == 2
                Tprevious = varargin{1};
                T = Tprevious * obj.getA_i();
            else
                T = obj.getA_i;
            end
        end

    end
end