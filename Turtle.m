classdef Turtle
    % LOGO turtle
    
    properties
        x;
        y;
        step_size;
        angle_increment;
    end
    
    methods
        function obj = Turtle(x0, y0, step_size, angle_increment)
            obj.x = x0;
            obj.y = y0;
            obj.step_size = step_size;
            obj.angle_increment = angle_increment;
        end
    end
    
end

