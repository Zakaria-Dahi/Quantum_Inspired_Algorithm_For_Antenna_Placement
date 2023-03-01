function [ DECIMAL_VECT ] = DECIMAL( population,Dimension)
DECIMAL_VECT = [];
i = 1;
j = 1;
while i<=(Dimension - 1)
    DECIMAL_VECT(j) = bi2de([population(i+1),population(i)]);
    i = i +2;
    j = j+1;
end
end

