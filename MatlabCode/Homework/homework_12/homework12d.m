% Use the built in function fzero for problem 3_04

clear, clc, close all;

% fzero needs a handle so I will just use an anon function to save typing

myX = fzero( @(x) x - (1 + 1/x)^x, 10)