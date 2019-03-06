classdef Turtle < handle
    % simple 2D turtle
    % characters and their interpretations:
    % 'F' - move forward and draw line
    % 'f' - move forward without drawing the line
    % '+' - turn right
    % '-' - turn left
    
    properties 
        step_size;
        angle_increment;
    end
    
    properties (Access = private)
        xOffset;
        yOffset;
        offset;
        buffer;
    end
    
    methods
        
        function this = Turtle(step_size, angle_increment)            
            this.step_size = step_size;
            this.angle_increment = angle_increment;
            
            this.offset = 10;
        end
        
        function picture = draw(this, string)
            picture = ones(this.calculate(string)) * 255;
            for i = 1:length(this.buffer(:,1))
                
                oldX = this.buffer(i,1) + this.xOffset;
                oldY = this.buffer(i,2) + this.yOffset;
                newX = this.buffer(i,3) + this.xOffset;
                newY = this.buffer(i,4) + this.yOffset;
                
                nPoints = max(abs(diff([newX, oldX])), abs(diff([newY, oldY])))+1;
            
                rIndex = round(linspace(oldX, newX, nPoints));
                cIndex = round(linspace(oldY, newY, nPoints));
                index = sub2ind(size(picture), rIndex, cIndex);
                picture(index) = 0;
            end
        end
        
    end
    
    methods (Access = private)
        
        function size = calculate(this, string)
            currentX = 0;
            currentY = 0;
            angle = 0;
            
            minX = 0;
            minY = 0;
            maxX = 0;
            maxY = 0;
            
            % clear buffer
            this.buffer = [];
            
            for i = 1:length(string)
                switch string(i)
                    case 'F'    % move forward and draw
                        % save old coordinates
                        oldX = currentX;
                        oldY = currentY;
                        % calculate new coordinates
                        currentX = round(currentX + this.step_size * cosd(angle));
                        currentY = round(currentY + this.step_size * sind(angle));
                        % add to buffer
                        this.buffer = [this.buffer; [oldX, oldY, currentX, currentY]];
                        
                    case 'f'    % move forward without drawing
                        % calculate new coordinates
                        currentX = round(currentX + this.step_size * cosd(angle));
                        currentY = round(currentY + this.step_size * sind(angle));
                        
                    case '+'    % turn right
                        angle = angle + this.angle_increment;
                        
                    case '-'    % turn left
                        angle = angle - this.angle_increment;
                    otherwise
                        %disp('wrong character!');                        
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
            this.xOffset = abs(minX) + this.offset;
            this.yOffset = abs(minY) + this.offset;
            
            size = [(maxX - minX) + 2 * this.offset, (maxY - minY) + 2 * this.offset];
        end
        
    end
    
end

