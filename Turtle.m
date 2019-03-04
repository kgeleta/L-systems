classdef Turtle < handle
    % turtle
    
    properties
        x;
        y;
        angle;
        
        step_size;
        angle_increment;
        offset;
    end
    
    methods
        function this = Turtle(step_size, angle_increment)
            this.angle = 0;
            this.step_size = step_size;
            this.angle_increment = angle_increment;
            
            this.offset = 10;
        end
        
        function picture = draw(this, string)
            picture = ones(this.calculate(string)) * 255;
            for i = 1:length(string)
                %for testing:
                %fprintf("X = %d Y = %d angle = %d\n", this.x, this.y, this.angle);
                switch string(i)
                    case 'F'
                        picture = this.moveDraw(picture);
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
        
        function size = calculate(this, string)
            currentX = 0;
            currentY = 0;
            angle = 0;
            
            minX = 0;
            minY = 0;
            maxX = 0;
            maxY = 0;
            
            for i = 1:length(string)
                switch string(i)
                    case 'F'
                        currentX = round(currentX + this.step_size * cosd(angle));
                        currentY = round(currentY + this.step_size * sind(angle));
                    case 'f'
                        currentX = round(currentX + this.step_size * cosd(angle));
                        currentY = round(currentY + this.step_size * sind(angle));
                    case '+'
                        angle = angle + this.angle_increment;
                    case '-'
                        angle = angle - this.angle_increment;
                    otherwise
                        disp('wrong character!');                        
                end
                if(currentX < minX)
                    minX = currentX;
                end
                if(currentX > maxX)
                    maxX = currentX;
                end
                if(currentY < minY)
                    minY = currentY;
                end
                if(currentY > maxY)
                    maxY = currentY;
                end
            end
            this.x = abs(minX) + this.offset;
            this.y = abs(minY) + this.offset;
            
            size = [(maxX - minX) + 2 * this.offset, (maxY - minY) + 2 * this.offset];
        end
        
    end
    
end

