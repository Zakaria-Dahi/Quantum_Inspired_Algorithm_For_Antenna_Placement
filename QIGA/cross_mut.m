function [population] = cross_mut(population,percentage,indiv,Dimension,pcr,pm)
if mod((indiv*((100 - percentage)/100)) ,2) == 0
    cr =  randi([1,(indiv*(percentage/100))],(indiv*((100 - percentage)/100))/2,2);
    for k=1:((indiv*((100 - percentage)/100))/2)
        c1 = [];
        c2 = [];
        if rand < pcr
            cross_point_one = randi(Dimension);
            cross_point_two = randi(Dimension);
            if cross_point_one > cross_point_two
                a = cross_point_one;
                cross_point_one = cross_point_two;
                cross_point_two = a;
            end
            c1 = [population(cr(k,1),1:cross_point_one) population(cr(k,2),(cross_point_one+1):cross_point_two) population(cr(k,1),(cross_point_two + 1):Dimension)];
            c2 = [population(cr(k,2),1:cross_point_one) population(cr(k,1),(cross_point_one+1):cross_point_two) population(cr(k,2),(cross_point_two + 1):Dimension)];
        else
            c1 = population(cr(k,1),:);
            c2 = population(cr(k,2),:);
        end
        for n=1:Dimension
            if rand < pm
                c1(n) = sqrt(1 -  (c1(n)^2));
                c2(n) = sqrt(1 -  (c2(n)^2));
            end
        end
        population = [population ; c1 ;c2];
    end
else
    cr =  randi([1,(indiv*(percentage/100))],((indiv*((100 - percentage)/100))/2)+1,2);
    for k=1:((indiv*((100 - percentage)/100))/2)
        c1 = [];
        c2 = [];
        if rand < pcr
            cross_point_one = randi(Dimension);
            cross_point_two = randi(Dimension);  
            if cross_point_one > cross_point_two
                a = cross_point_one;
                cross_point_one = cross_point_two;
                cross_point_two = a;
            end
            c1 = [population(cr(k,1),1:cross_point_one) population(cr(k,2),(cross_point_one+1):cross_point_two) population(cr(k,1),(cross_point_two + 1):Dimension)];
            c2 = [population(cr(k,2),1:cross_point_one) population(cr(k,1),(cross_point_one+1):cross_point_two) population(cr(k,2),(cross_point_two + 1):Dimension)];
        else
            c1 = population(cr(k,1),:);
            c2 = population(cr(k,2),:);
        end
        for n=1:Dimension
            if rand < pm
                c1(n) = sqrt(1 -  (c1(n)^2));
                c2(n) = sqrt(1 -  (c2(n)^2));
            end
        end
        population = [population ; c1 ;c2];
    end
    c1 = [];
    c2 = [];
    taille = size(cr);
    if rand < pcr
        cross_point_one = randi(Dimension);
        cross_point_two = randi(Dimension);  
        if cross_point_one > cross_point_two
            a = cross_point_one;
            cross_point_one = cross_point_two;
            cross_point_two = a;
        end
        c1 = [population(cr(k,1),1:cross_point_one) population(cr(k,2),(cross_point_one+1):cross_point_two) population(cr(k,1),(cross_point_two + 1):Dimension)];
    else
        c1 = population(cr(taille(1),1),:);
    end
    for n=1:Dimension
        if rand < pm
            c1(n) = sqrt(1 - (c1(n)^2));
        end
    end
    population = [population ; c1];
end 
end

