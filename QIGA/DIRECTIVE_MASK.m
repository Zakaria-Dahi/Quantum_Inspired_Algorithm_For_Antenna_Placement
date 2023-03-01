function [ mask ] = DIRECTIVE_MASK(radius)
%% compute the mask 
mask = [];
X = radius +1;
Y = radius +1;
%% COMPUTE THE DEPLACEMENT 
area_1 = zeros(((2*radius) + 1),((2*radius) + 1)); 
area_2 = zeros(((2*radius) + 1),((2*radius) + 1)); 
area_3 = zeros(((2*radius) + 1),((2*radius) + 1)); 
a = cosd(60)*radius;
x_plus = X + a;
x_less = X - a;
c = floor(sqrt(radius^2 - a^2));
%% PROCESSING THE FIRST DIRECTIVE
x_plus_1 = x_plus;
x_less_1 = x_less;
y_plus_1 = Y - c;
y_less_1 = Y - c;
x = [X x_plus_1 x_less_1];
y = [Y y_plus_1 y_less_1];
area_1 = roipoly(area_1,x,y);

for i=(Y - radius):y_plus_1
    for j=x_less_1:x_plus_1
        i = round(i);
        j =round(j);
        x2 = j;
        y2 = i;
        val = ceil(sqrt((x2-X)^2 + (y2-Y)^2));
        if(val == ceil(radius))
            area_1(i,j) = 1;
        else
            area_1(i,j) = 0;
        end
    end
end

%% PROCESSING THE second DIRECTIVE
x_plus_2 = X + radius;
x_less_2 = x_plus;
y_plus_2 = Y;
y_less_2 = Y + c;
x = [X x_plus_2 x_less_2];
y = [Y y_plus_2 y_less_2];
area_2 = roipoly(area_2,x,y);

for i=y_plus_2:y_less_2
    for j=x_less_2:x_plus_2
        i = round(i);
        j =round(j);
        x2 = j;
        y2 = i;
        val = floor(sqrt((x2-X)^2 + (y2-Y)^2));
        if(val == floor(radius))
            area_1(i,j) = 1;
        else
            area_1(i,j) = 0;
        end
    end
end
%% PROCESSING THE THIRD DIRECTIVE
x_plus_3 = X - radius;
x_less_3 = x_less;
y_plus_3 = Y;
y_less_3 = Y + c;
x = [X x_plus_3 x_less_3];
y = [Y y_plus_3 y_less_3];
area_3 = roipoly(area_3,x,y);

for i=y_plus_3:y_less_3
    for j=x_plus_3:x_less_3
        i = round(i);
        j =round(j);
        x2 = j;
        y2 = i;
        val = floor(sqrt((x2-X)^2 + (y2-Y)^2));
        if(val == floor(radius))
            area_1(i,j) = 1;
        else
            area_1(i,j) = 0;
        end
    end
end
mask = area_1 +area_2 + area_3;
mask = imfill(mask,'holes');
mask(radius +1,(2*radius)+1) = 0;
mask(radius +1,1) = 0;
mask(X,Y) = 1;


end

