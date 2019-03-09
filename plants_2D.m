close all;
clearvars;
clc;

% simple 2D plants:

%%
productions = containers.Map({'F'}, {'F[+F]F[-F]F'});
axiom = 'F';

string = generate_successor(axiom, productions);
for i = 1:4
    string = generate_successor(string, productions);
end

figure;
myTurtle = Turtle(2, 25.7);
% plants are upside down - imrotate
imshow(imrotate(myTurtle.draw(string), 180));

%%
productions = containers.Map({'F','X'}, {'FF', 'F-[[X]+X]+F[+FX]-X'});
axiom = 'X';

string = generate_successor(axiom, productions);
for i = 1:4
    string = generate_successor(string, productions);
end

figure;
myTurtle = Turtle(5, 22.5);
% plants are upside down - imrotate
imshow(imrotate(myTurtle.draw(string), 180));

%%
productions = containers.Map({'Y','X'}, {'YFX[+Y][-Y]', 'X[-FFF][+FFF]FX'});
axiom = 'Y';

string = generate_successor(axiom, productions);
for i = 1:5
    string = generate_successor(string, productions);
end

figure;
myTurtle = Turtle(3, 25.7);
% plants are upside down - imrotate
imshow(imrotate(myTurtle.draw(string), 180));

%%
productions = containers.Map({'F'}, {'FF+[+F-F-F]-[-F+F+F]'});
axiom = 'F';

string = generate_successor(axiom, productions);
for i = 1:3
    string = generate_successor(string, productions);
end

figure;
myTurtle = Turtle(7, 22.5);
% plants are upside down - imrotate
imshow(imrotate(myTurtle.draw(string), 180));

%%
productions = containers.Map({'F', 'X'}, {'FF', 'F[+X]F[-X]+X'});
axiom = 'X';

string = generate_successor(axiom, productions);
for i = 1:6
    string = generate_successor(string, productions);
end

figure;
myTurtle = Turtle(2, 20);
% plants are upside down - imrotate
imshow(imrotate(myTurtle.draw(string), 180));