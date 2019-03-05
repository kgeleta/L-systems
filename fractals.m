close all;
clearvars;
clc;

% examples of fractals:

%% quadratic Koch island
productions = containers.Map({'F'}, {'F+F-F-FF+F+F-F'});
axiom = 'F+F+F+F';

string1 = generate_successor(axiom, productions);
string2 = generate_successor(string1, productions);
string3 = generate_successor(string2, productions);

figure;
myTurtle = Turtle(3, 90);
imshow(myTurtle.draw(string3));

%% combination of islands and lakes
productions = containers.Map({'F', 'f'}, {'F-f+FF-F-FF-Ff-FF+f-FF+F+FF+Ff+FFF', 'ffffff'});
axiom = 'F-F-F-F';

string1 = generate_successor(axiom, productions);
string2 = generate_successor(string1, productions);

myTurtle = Turtle(5, 90);
figure;
imshow(myTurtle.draw(string2));

%%
productions = containers.Map({'F'}, {'FF+F+F+F+F+F-F'});
axiom = 'F+F+F+F';

string1 = generate_successor(axiom, productions);
string2 = generate_successor(string1, productions);
string3 = generate_successor(string2, productions);
string4 = generate_successor(string3, productions);

figure;
myTurtle = Turtle(3, 90);
imshow(myTurtle.draw(string4));

%%
productions = containers.Map({'F'}, {'FF+F+F+F+FF'});
axiom = 'F+F+F+F';

string1 = generate_successor(axiom, productions);
string2 = generate_successor(string1, productions);
string3 = generate_successor(string2, productions);
string4 = generate_successor(string3, productions);

figure;
myTurtle = Turtle(3, 90);
imshow(myTurtle.draw(string4));

%%
productions = containers.Map({'F'}, {'FF+F-F+F+FF'});
axiom = 'F+F+F+F';

string1 = generate_successor(axiom, productions);
string2 = generate_successor(string1, productions);
string3 = generate_successor(string2, productions);

figure;
myTurtle = Turtle(10, 90);
imshow(myTurtle.draw(string3));

%% dragon generating L-system
productions = containers.Map({'l', 'r'}, {'l+rF+', '-Fl-r'});
axiom = 'Fl';

string = generate_successor(axiom, productions);
for i = 1:9
    string = generate_successor(string, productions);
end
    
    
figure;
myTurtle = Turtle(10, 90);
imshow(myTurtle.draw(string));

%% angle increment = 120
productions = containers.Map({'F'}, {'F-F+F'});
axiom = 'F+F+F';

string = generate_successor(axiom, productions);
for i = 1:4
    string = generate_successor(string, productions);
end

figure;
myTurtle = Turtle(20, 120);
imshow(myTurtle.draw(string));

%%
productions = containers.Map({'X'}, {'XF-F+F-XF+F+XF-F+F-X'});
axiom = 'F+XF+F+XF';

string = generate_successor(axiom, productions);
for i = 1:4
    string = generate_successor(string, productions);
end

figure;
myTurtle = Turtle(3, 90);
imshow(myTurtle.draw(string));
