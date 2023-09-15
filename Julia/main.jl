include("toolbox/SE2.jl")
using .SE2Module

T1_SE2 = SE2(1.0, 2.0, deg2rad(30))
T1 = SE2Module.get_T(T1_SE2)