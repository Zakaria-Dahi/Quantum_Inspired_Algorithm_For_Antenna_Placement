function [population_selected] =  Matting_pool(population,proba_vector,indiv,percentage)
cursor = 360*rand(1,(indiv*(percentage/100)));
population_selected = [];
for h=1:length(cursor)
    for m=1:(length(proba_vector)-1)
        if (proba_vector(m)<= cursor(h)) & (cursor(h) <=proba_vector(m+1))
            population_selected = [population_selected;population(m,:)];
        end
    end
end
end

