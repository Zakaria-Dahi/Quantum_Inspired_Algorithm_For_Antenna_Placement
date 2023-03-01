function [ mask ] = SQUARED_MASK(radius)
%% compute the mask 
mask = [];
%% COMPUTE THE DEPLACEMENT
mask = ones(((2*radius) + 1),((2*radius) + 1));
end

