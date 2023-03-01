function [ mask ] = CIRCLE_MASK( radius )
%% compute the mask 
mask = [];
X = radius +1;
Y = radius +1;
%% COMPUTE THE DEPLACEMENT 
[x, y] = meshgrid(1:((2*radius) + 1),1:((2*radius) + 1));
mask = hypot(floor(x-X), floor(y-Y))<=radius ;
end

