classdef jointClass
    properties
        a_i = 0; %The offset distance between the z(i-1) and z(i) axes along the x(i) axis
        alpha_i = 0; %the angle from the z(i-1) axis to the z(i) axis about the x(i) axis
        d_i = 0; %the distance from the origin of frame i-1 to the x(i) axis along the z(i-1) axis
        theta_i = 0; %the angle between the x(i-1) and x(i) axes about the z(i-1) axis

        theta_min = 0;
        theta_max = 0;

        %generalized forces
        tau_i = 0;
        f_i = 0;

        m_i = 0;

        jointType = "revolute" %revolute or prismatic
    end


    methods
        function obj = jointClass(alpha, a, d, theta_min, theta_max, theta, tau, f, type, m)
            obj.a_i = a;
            obj.alpha_i = alpha;
            obj.d_i = d;
            obj.theta_i = theta;
            obj.tau_i = tau;
            obj.f_i = f;
            obj.jointType = type;
            obj.theta_min = theta_min;
            obj.theta_max = theta_max;
            obj.m_i = m;
        end
        % For a revolute joint θi is the joint variable and di is constant, while for a prismatic
        % joint di is variable, and θi is constant. In many of the formulations that follow we use
        % generalized coordinates, qi, where

        function obj = set.a_i(obj, a)
            obj.a_i = a;
        end

        function obj = set.alpha_i(obj, alpha)
            obj.alpha_i = deg2rad(alpha);
        end
        
        function obj = set.d_i(obj, d)
            obj.d_i = d;
        end

        function obj = set.theta_i(obj, theta)
            theta_rad = deg2rad(theta);

            if theta_rad > obj.theta_max
                obj.theta_i = obj.theta_max;
            elseif theta_rad < obj.theta_min
                obj.theta_i = obj.theta_min;
            else
                obj.theta_i = theta_rad;
            end
        end

        function obj = set.theta_min(obj, theta_min)
            obj.theta_min = deg2rad(theta_min);
        end

        function obj = set.theta_max(obj, theta_max)
            obj.theta_max = deg2rad(theta_max);
        end

        function obj = set.tau_i(obj, tau)
            obj.tau_i = tau;
        end

        function obj = set.f_i(obj, f)
            obj.f_i = f;
        end

        function obj = set.jointType(obj, type)
            obj.jointType = type;
        end

        function obj = set.m_i(obj, m)
            obj.m_i = m;
        end


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