function [ population ] = GeneratePopulation(indiv,Dimension)
%% Generate the initial population -------------
randn('state',sum(100*clock));
population = ones(indiv,Dimension) * (1/sqrt(2));
%% ---------------------------------------------
end

