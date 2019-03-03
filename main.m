close all;
clearvars;
clc;

% quadratic Koch island:
productions = containers.Map({'F'}, {'F+F-F-FF+F+F-F'});

axiom = 'F+F+F+F';

string1 = generate_successor(axiom, productions);
string2 = generate_successor(string1, productions);
string3 = generate_successor(string2, productions);



myTurtle = Turtle(170, 180, 0, 150, 90);
picture = ones(512, 512) * 255;

%% n = 0

figure;
imshow(myTurtle.draw(picture, axiom));

%% n = 1

myTurtle.step_size = 20;
figure;
imshow(myTurtle.draw(picture, string1));


%% n = 2

myTurtle.step_size = 5;
figure;
imshow(myTurtle.draw(picture, string2));

%% n = 3

myTurtle.step_size = 2;
figure;
imshow(myTurtle.draw(picture, string3));
