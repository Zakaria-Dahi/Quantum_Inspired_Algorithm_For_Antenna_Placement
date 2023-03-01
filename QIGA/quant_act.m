function [population_bin] = quant_act(population_bin,population,population_rand)
population = (population.*population);
population_bin  = (population_rand < population);
end

