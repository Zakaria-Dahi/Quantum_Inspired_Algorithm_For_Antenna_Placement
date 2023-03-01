function [prob] = RW_selection(fit,indiv)
prob = [];
summ = sum(fit);
prob = (fit/summ)*360;
for curs=2:indiv
    prob(curs) =  prob(curs)+prob(curs-1);
end
prob = [0 prob];
end

