for ind=1:13
%%% Reinitialize the random generator in matlab 
randn('state',sum(100*clock));
%%     Number of individuals contained in the population
global  indiv
        indiv = 135;
%% Number of itterations 
global iter
       iter = 200;
%% Number of execution 
global Nexe
       Nexe = 20;
%% the upper and the lower band
global maxim
       maxim = 1; 
global minim 
       minim = 0;
%% Vector indexing the shapes and the instances
inst= [1,1,1,2,2,2,8,8,8,9,9,9,3];
sha = [1,2,3,1,2,3,1,2,3,1,2,3,2];
%% Type of instance
global instance 
       instance = inst(ind);
%% to determine shape of the cell -------------
global shape 
       shape = sha(ind);

%%   Dimension of the individual in the population (dimesion of the  problem)
global Dimension
global Dimension_SAVED

if instance == 1
       Dimension = 149;
end
if instance == 2
       Dimension = 349;
end
if instance == 3
       Dimension = 1000;
end
if instance == 4
       Dimension = 2000;
end
if instance == 5
       Dimension = 3000;
end
if instance == 6
       Dimension = 4000;
end
if instance == 7
       Dimension = 5000;
end
if instance == 8
       Dimension = 549;
end
if instance == 9
       Dimension = 749;
end
%% IF  ALL ANTENNA ARE USED 
if shape == 123
   Dimension_SAVED = Dimension;
   Dimension = Dimension *2;
end
%% parameter of the experimental 

%%%  the size of the geographical treted area 
global GRID_SIZE_X
global GRID_SIZE_Y
if instance == 1 | instance == 2
    GRID_SIZE_Y = 287;
    GRID_SIZE_X = 287;
end
if instance == 3
    GRID_SIZE_Y = 300;
    GRID_SIZE_X = 450;
end
if instance == 4 | instance == 5 | instance == 6 | instance == 7
   GRID_SIZE_Y = 724;
   GRID_SIZE_X = 724;
end
if instance == 8 | instance == 9
    GRID_SIZE_Y = 300;
    GRID_SIZE_X = 300;
end
%%% the redius of each type of antenna         
global  radius_1
global  radius_2
global  radius_3

%%% the coordinate according to the antenna type 
global  SQUARE_XY
global  DIRECTIVE_XY

%%% attribution of the coordinate and the radius according of the type of combination wanted 
%%% If instance two is used (149 BTS)
if instance == 1
if shape == 1 
    radius_1 =  20;
    SQUARE_XY = COORDINATE(1);
else
    if shape == 2 
    radius_2 = 22;
    DIRECTIVE_XY = COORDINATE (1);
    end
    if shape == 3
    radius_3 = 22;
    DIRECTIVE_XY = COORDINATE (1);
    end
end
end

%%% If instance two is used (349 BTS)
if instance == 2
if shape == 1 
    radius_1 =  20;
    SQUARE_XY = COORDINATE(2);
else
    if shape == 2 
    radius_2 = 22;
    DIRECTIVE_XY = COORDINATE (3);
    end
    if shape == 3 
    radius_3 = 22;
    DIRECTIVE_XY = COORDINATE (3);
    end
end
end
%%% If instance three is used (1000 BTS)
if instance == 3
if shape == 1 
    radius_1 =  20;
    SQUARE_XY = COORDINATE(4);
else
    if shape == 2 
    radius_2 = 30;
    DIRECTIVE_XY = COORDINATE (4);
    end
end
end
%%% If instance three is used (2000 BTS)
if instance == 4
if shape == 1 
    radius_1 =  20;
    SQUARE_XY = COORDINATE(5);
else
    if shape == 2 
    radius_2 = 22;
    DIRECTIVE_XY = COORDINATE (5);
    end
end
end
%%% If instance three is used (3000 BTS)
if instance == 5
if shape == 1 
    radius_1 =  20;
    SQUARE_XY = COORDINATE(6);
else
    if shape == 2 
    radius_2 = 22;
    DIRECTIVE_XY = COORDINATE (6);
    end
end
end
%%% If instance three is used (4000 BTS)
if instance == 6
if shape == 1 
    radius_1 =  20;
    SQUARE_XY = COORDINATE(7);
else
    if shape == 2 
    radius_2 = 22;
    DIRECTIVE_XY = COORDINATE (7);
    end
end
end
%%% If instance three is used (2000 BTS)
if instance == 7
if shape == 1 
    radius_1 =  20;
    SQUARE_XY = COORDINATE(8);
else
    if shape == 2 
    radius_2 = 22;
    DIRECTIVE_XY = COORDINATE (8);
    end
end
end
%%% If instance three is used (549 BTS)
if instance == 8
if shape == 1 
    radius_1 =  24;
    SQUARE_XY = COORDINATE(9);
else
    if shape == 2 
    radius_2 = 26;
    DIRECTIVE_XY = COORDINATE (9);
    end
    if shape == 3 
    radius_3 = 26;
    DIRECTIVE_XY = COORDINATE (9);
    end
end
end
%%% If instance three is used (749 BTS)
if instance == 9
if shape == 1 
    radius_1 =  24;
    SQUARE_XY = COORDINATE(10);
else
    if shape == 2 
    radius_2 = 26;
    DIRECTIVE_XY = COORDINATE (10);
    end
    if shape == 3 
    radius_3 = 26;
    DIRECTIVE_XY = COORDINATE (10);
    end
end
end
%% ------ Computing the directive or the circle mask for processing
global mask_1
global mask_2
global mask_3

if shape == 1 | shape == 123
   mask_1 = SQUARED_MASK (radius_1);
end
if shape == 2 | shape == 123
   mask_2 = CIRCLE_MASK (radius_2);
end
if shape == 3 | shape == 123
   mask_3 = DIRECTIVE_MASK(radius_3);
end
%% Prameter  of the  Population based incremental learning  algorithm PBIL  ----------------------
%---- All parameter were extracted from the article : Benchmarking a wide spectrum of Metaheuristic technique for the radio network design problem page 1139
  global MUT_P
         MUT_P = 0.02;  
  global MUT_A 
         MUT_A = 0.05;
  global LR
         LR = 0.10;
%% variable to savec for each execution
     %%%%   Fitness of the best individual reach after the end of all the ietteration 
     global ALL_EXECUTION
            ALL_EXECUTION = [];
     %%%% Save all the execution Time per run 
     global ALL_TIME
            ALL_TIME = [];
     %%%%% save all the best fitnesses through the generations
     global ALL_FITNESSES
            ALL_FITNESSES = [];
     %%%%% save all the itterations where the fitness value where extracted
     global ALL_ITTERATIONS
            ALL_ITTERATIONS = [];
     %%%% Mean of all the fitness reached  
     global moy
            moy =0;
     %%%% Standard deviation of the fitness reached 
     global ecart 
            ecart = 0;
     %%%% to save all the information relative to the experiment 
     global vect_one 
            vect_one = [];
     global vect_two
            vect_two = [];
     %%%% to save to best individual all along the NEXE execution 
     global FITNESS_GBEST
            FITNESS_GBEST = 0;
     %%%% to save the best individual all along the Nexe exveution 
     global GBEST_ALL
            GBEST_ALL = [];
%% ------------------------------------------------------------------------
for exe=1:Nexe
ALL_FITNESSES = [];
ALL_ITTERATIONS = [];
ti = 0;
tic
%% variable used during the calcul ---------------------------------------
     %%% Vector conaiting the fitness of all individuals of the population 
     result = 0;
     %%% Vector containing the best individual so far 
     global gbest
            gbest = [];
     %%%  Contain the fitness of the global best individual
     global fitness_best
            fitness_best = 0;
     %%%% The population 
     population = [];
     %%%% Vector that save the central probability vector |0.5|0.5|0.5|0.5|0.5|
     global probability_vector 
            probability_vector = ones(1,Dimension)*0.5;
     %%% Counter of fitness evaluation
     it = 0;
     %%% save the previous best solution
     global prev_gbest 
            prev_gbest = [];
     %%%% save the fitness of the previous best solution
     global prev_fitness_best
            prev_fitness_best = 0;
     
while it <= 19999  % --------------- while loop  -----------------------------
%% ------------ Generate the intial population ---------------------
population = rand(indiv,Dimension);
fit = zeros(1,indiv);
gbest = [];
% ------------------------------------------------------------------
%% ------------------------------Employee Phase------------------------
reste = 20000 - it; 
if reste > 0
    if reste >= indiv 
        individual = indiv;
    else
        individual = reste;
    end
for  w=1:individual% ---------------- Employee Phase -----------------------
  %% ------The prosessing of the PBIL algorithm --------------------------------
    for j=1:Dimension
      if population(w,j) < probability_vector(j)
         population(w,j) = 1;
      else
         population(w,j) = 0;
      end
    end
  % -----------------------------------------------------------------
         
 %% ---------------------- Evaluate the new solutions---------------------------
    if shape == 1 %% if you choose squared shape antenna
        result  = Fitness(population(w,:),Dimension,radius_1,GRID_SIZE_X,GRID_SIZE_Y,SQUARE_XY,mask_1); %% c'est OK
    else
        if shape == 2
        result  = Fitness_two(population(w,:),Dimension,radius_2,GRID_SIZE_X,GRID_SIZE_Y,DIRECTIVE_XY,mask_2);
        end
        if shape == 3
        result  = Fitness_three(population(w,:),Dimension,radius_3,GRID_SIZE_X,GRID_SIZE_Y,DIRECTIVE_XY,mask_3); %% c'est OK
        end
        if shape == 123
        DECIMAL_VECT = DECIMAL(population(w,:),Dimension);
        result  = Fitness_ALL(DECIMAL_VECT,Dimension_SAVED,radius_1,radius_2,radius_3,GRID_SIZE_X,GRID_SIZE_Y,DIRECTIVE_XY,SQUARE_XY,mask_1,mask_2,mask_3); %% c'est OK
        end
    end
 % -------------------------------------------------------------------------
 
     
 %% ----- Update the new fitness value of the population ------
     fit(w) = result ;
     result = 0;
 %-------------------------------------------------------------------------             
end 
it = it + individual;
end
%% ------------calculate the new best individual --------------------
[bestFit,indbest] = max(fit);
gbest = population(indbest,:);
fitness_best = fit(indbest);
if fitness_best < prev_fitness_best
   gbest = prev_gbest;
   fitness_best = prev_fitness_best;
else
    prev_fitness_best = fitness_best;
    prev_gbest = gbest;
end
% -------------------------------------------------------------------------
%% ------------- updating the probability centeral vector ----------------
probability_vector = (probability_vector * (1 - LR)) + (gbest *(LR));
%%% -----------------------------------------------------------------------

%% ------------- Mutate the probability central evctor --------------------
for k=1:Dimension 
    if rand < MUT_P
        probability_vector(k) =  (probability_vector(k)*(1 - MUT_A)) + (rand * MUT_A);
    end
end
%%%------------------------------------------------------------------------
it
ALL_FITNESSES = [ALL_FITNESSES fitness_best]; 
ALL_ITTERATIONS = [ALL_ITTERATIONS it];
end %--------------end of the loop while -------------------------------
if FITNESS_GBEST < fitness_best
FITNESS_GBEST = fitness_best;
GBEST_ALL = gbest;
end
ALL_EXECUTION = [ALL_EXECUTION fitness_best];
exe
oo = toc;
ti = ti + oo;
ALL_TIME = [ALL_TIME ti];
end
%% ----  Writing the result -----------------------------------------------
moy =  mean(ALL_EXECUTION);
ecart = std (ALL_EXECUTION);
datte = mat2cell(date);
timee =  num2str(sum(ALL_TIME));
timme =  mat2cell(timee);
%% to cpecify the type of shape 
if shape == 1
    shappe = 'Squared';
end
if shape == 2
   shappe = 'Circle';
end
if shape == 3
   shappe = 'Directive';
end
if shape == 123
      shappe = 'All_Shapes';
end

%% to specify the type of instance 
if instance == 1
    instancee = '149_Sites';
end
if instance == 2
   instancee = '349_Sites';
end
if instance == 3
   instancee = '1000_Sites';
end
if instance == 4
   instancee = '2000_Sites';
end
if instance == 5
   instancee = '3000_Sites';
end
if instance == 6
   instancee = '4000_Sites';
end
if instance == 7
   instancee = '5000_Sites';
end
if instance == 8
   instancee = '549_Sites';
end
if instance == 9
   instancee = '749_Sites';
end
if shape == 123
vect_one = [datte Nexe it indiv (Dimension/2) instancee shappe timme mean(ALL_TIME) std(ALL_TIME)  max(ALL_EXECUTION) min(ALL_EXECUTION) moy ecart];
else
vect_one = [datte Nexe it indiv Dimension instancee shappe timme mean(ALL_TIME) std(ALL_TIME)  max(ALL_EXECUTION) min(ALL_EXECUTION) moy ecart];
end
headers = {'date', 'Nbr_Execution','Nbr_Fitness_Evaluations','Nbr_Individual','Dimension','Instance','Shape','Execution_Time','Mean','Std','Best','Worst','Mean','Std'};
name = strcat(instancee,'_',shappe,'.xls');
xlswrite(name,[headers;vect_one],1);
xlswrite(name,ALL_EXECUTION,3);
xlswrite(name,ALL_TIME,4);
xlswrite(name,transpose(ALL_FITNESSES),5);
xlswrite(name,transpose(ALL_ITTERATIONS),6);
%% visualisation du resultat de couverture --------------------------------
datee =  num2str(date);
timee =  num2str(toc);
if shape == 1
      %% if you choose squared shape antenna
      [final_area,transmitters,coverage,overcoverage,ratio,fitness] = VISUAL(GBEST_ALL,Dimension,radius_1,GRID_SIZE_X,GRID_SIZE_Y,SQUARE_XY,mask_1);
      %% ----- generate the first image ----------------------------------------------
      title =strcat('SQUARED_SHAPED_ANTENNA\',datee,'.gif');
      imwrite(final_area,title);
else
    if shape == 2
      [final_area,transmitters,coverage,overcoverage,ratio,fitness] = VISUAL_two(GBEST_ALL,Dimension,radius_2,GRID_SIZE_X,GRID_SIZE_Y,DIRECTIVE_XY,mask_2);
      %% ----- generate the first image ----------------------------------------------
      title =strcat('CIRCLE_SHAPED_ANTENNA\',datee,'.gif');
      imwrite(final_area,title);
    end
    if shape == 3
      [final_area,transmitters,coverage,overcoverage,ratio,fitness] = VISUAL_three(GBEST_ALL,Dimension,radius_3,GRID_SIZE_X,GRID_SIZE_Y,DIRECTIVE_XY,mask_3);
      %% ----- generate the first image ----------------------------------------------
      title =strcat('DIRECTIVE_SHAPED_ANTENNA\',datee,'.gif');
      imwrite(final_area,title);
    end 
    if shape == 123
      GBEST_ALL = DECIMAL(GBEST_ALL,Dimension);
      [final_area,transmitters,coverage,overcoverage,ratio,fitness] = VISUAL_ALL(GBEST_ALL,Dimension_SAVED,radius_1,radius_2,radius_3,GRID_SIZE_X,GRID_SIZE_Y,DIRECTIVE_XY,SQUARE_XY,mask_1,mask_2,mask_3);
      %% ----- generate the first image ----------------------------------------------
      title =strcat('ALL_SHAPED_ANTENNA\',datee,'.gif');
      imwrite(final_area,title);
    end
end
if ratio <= 0
   'Your coverage is inapropriate'
end
vect_two = [datte transmitters coverage (coverage/(GRID_SIZE_X * GRID_SIZE_Y)* 100) overcoverage (overcoverage/(GRID_SIZE_X * GRID_SIZE_Y)* 100) (coverage + overcoverage) ratio fitness];
headers = {'date','Nbr_Transmitters','Coverage_grid','covrage_percent','Overcoverage_grid','overcovrage_percent','covrage_impure','coverage_impure_percent','Fitness'};
xlswrite(name,[headers;vect_two],2);
end