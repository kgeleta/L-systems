close all;
clearvars;
clc;

% examples of Koch constructions:

%%

productions = containers.Map({'F'}, {'F+F-F-FF+F+F-F'});
axiom = 'F+F+F+F';

string1 = generate_successor(axiom, productions);
string2 = generate_successor(string1, productions);
string3 = generate_successor(string2, productions);

figure;
myTurtle = Turtle(3, 90);
imshow(myTurtle.draw(string3));

%% 
productions = containers.Map({'F', 'f'}, {'F-f+FF-F-FF-Ff-FF+f-FF+F+FF+Ff+FFF', 'ffffff'});
axiom = 'F-F-F-F';

string1 = generate_successor(axiom, productions);
string2 = generate_successor(string1, productions);
string3 = generate_successor(string2, productions);

myTurtle = Turtle(5, 90);
figure;
imshow(myTurtle.draw(string2));





