classdef JointOperationsClass
    properties
        joints = [];
    end

    methods
        function T = getT(obj) 
            lastJoint = length(obj.joints);
            T = obj.joints(1).getA_i();

            for i = 2:lastJoint
                T = T * obj.joints(i).getA_i();
            end
        end

        function q = getq(obj)
            q = zeros(size(obj.joints));

            for i = 1:length(obj.joints)
                q(i) = obj.joints(i).getq_i();
            end
        end

        function K = getK(obj) 
            K =  obj.getT() * pinv(obj.getq());
        end

        function J = getJ(obj)
            numberOfJoints = length(obj.joints);

            
            q = sym(obj.getq());

            T = obj.getT();
            Tx = T(1, 4);
            Ty = T(2, 4);
            Tz = T(3, 4);

            J = sym(zeros(3, numberOfJoints));

            for i = 1:numberOfJoints
                J(1, i) = diff(Tx, q(i));
                J(2, i) = diff(Ty, q(i));
                J(3, i) = diff(Tz, q(i));
            end

            J = double(J);
        end
        
    end
end