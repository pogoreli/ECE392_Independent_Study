module SE2Module

export SE2, get_T

    mutable struct SE2
        X::Float64
        Y::Float64
        THETA::Float64

        function SE2(X::Float64, Y::Float64, THETA::Float64)
            new(X, Y, THETA)
        end
    end

    function get_T(se2::SE2)
        T = [cos(se2.THETA) sin(se2.THETA) se2.X; -sin(se2.THETA) cos(se2.THETA) se2.Y; 0 0 1]  
        return T
    end
end

