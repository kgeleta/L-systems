classdef Turtle < handle
    % LOGO turtle
    
    properties
        x;
        y;
        angle;
        
        step_size;
        angle_increment;
    end
    
    methods
        function this = Turtle(x0, y0, angle, step_size, angle_increment)
            this.x = x0;
            this.y = y0;
            this.angle = angle;
            this.step_size = step_size;
            this.angle_increment = angle_increment;
        end
        
        function newPicture = draw(this, picture, string)
            newPicture = picture;
            for i = 1:length(string)
                % for testing:
                %fprintf("X = %d Y = %d angle = %d\n", this.x, this.y, this.angle);
                switch string(i)
                    case 'F'
                        newPicture = this.moveDraw(newPicture);
                    case 'f'
                        this.move();
                    case '+'
                        this.turnRight();
                    case '-'
                        this.turnLeft();
                    otherwise
                        disp('wrong character!');                        
                end
            end
        end
        
    end
    
    methods (Access = private)
        function newPicture = moveDraw(this, picture)
            newPicture = picture;
            
            newX = round(this.x + this.step_size * cosd(this.angle));
            newY = round(this.y + this.step_size * sind(this.angle));
    
            nPoints = max(abs(diff([newX, this.x])), abs(diff([newY, this.y])))+1;
            
            rIndex = round(linspace(this.x, newX, nPoints));
            cIndex = round(linspace(this.y, newY, nPoints));
            index = sub2ind(size(newPicture), rIndex, cIndex);
            newPicture(index) = 0;
            
            this.x = newX;
            this.y = newY;            
        end
        
        function move(this)
            this.x = round(this.x + this.step_size * cosd(this.angle));
            this.y = round(this.y + this.step_size * sind(this.angle));
        end
        
        function turnRight(this)
            this.angle = this.angle + this.angle_increment;
        end
        
        function turnLeft(this)
            this.angle = this.angle - this.angle_increment;
        end
    end
    
end

