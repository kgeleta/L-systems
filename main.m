close all;
clearvars;
clc;

% quadratic Koch island:
productions = containers.Map({'F'}, {'F+F-F-FF+F+F-F'});
axiom = 'F+F+F+F';

test = generate_successor(axiom, productions);
test2 = generate_successor(test, productions);