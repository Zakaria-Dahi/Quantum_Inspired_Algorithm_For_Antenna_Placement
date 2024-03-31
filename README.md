# Quick Description

**Programmers :shipit:**: Zakaria Abdelmoiz DAHI. 

**About:** This repositiory contains the implementation of the quantum-inspired genetic algorithm devised in [1] for solving the binary antenna placement using a conitnuous swarm algorithm. We use instances of `149 to 1000 antennas` (representing the city of Malga, Spain) and `three types of antennas` (Omnidirectional, directional and Squared). Evtually, I made an option for testing a fourth strategy where all types of antennas can be used.

- [1] **Z.A. DAHI**, C. Mezioud, A. Draa, A quantum-inspired genetic algorithm for solving the antenna positioning problem, Swarm and Evolutionary Computation, Volume 31, 2016, Pages 24-63, ISSN 2210-6502, https://doi.org/10.1016/j.swevo.2016.06.003.

## **How :green_book:** 

- Depending on the variant you want to execute you just need to navigate to the corresponding foldr: `GGA` for the generational genetic algorithm, `PBIL` for the population-based incremental learning and `QIGA` for the quantum-inspired genetic algorithm.
- Once you have navigated to the folder of the corresponding variant, you just need to execute the file `main.m`.


## **Folders Hiearchy :open_file_folder:**
    
- `GGA`: This folder contains the generational genetic algorithm.
- `QIGA`: This folder contains quantum-inspired genetic algorithm.
- `PBIL`: This folder contains the code of the `Population-Based Incremental Learning`. 

- `Results`: 
    - `Graphical`: the results will be automatically stored as `gif` figures.
    - `Nurmerical`: the results will be stored as `Excel` files with name as `instance_shape.xls`, where `instance` is the size of the benchmarks (i.e. the number of candidate Antennas) and `shape` is the shape of the antenna being using. The size ranges from 149 to 1000 candidate antennas, while for the shapes we use omnidirectional, directional and rectangular. 
        
## **Demo :movie_camera:**
    
- Please refer to the original paper [HERE](https://www.sciencedirect.com/science/article/pii/S2210650216300293) for more detailed results and discussions.

![08-Oct-2014](https://user-images.githubusercontent.com/68249696/222123414-ef9b0af1-1271-42f1-992c-050d05295fc1.gif)
![05-Apr-2014_174 9807](https://user-images.githubusercontent.com/68249696/222123453-52043b21-bfaa-44d7-8470-7eff65d914ea.gif)
![01-Nov-2014](https://user-images.githubusercontent.com/68249696/222123511-c42c8f57-a4e6-4ce9-9e29-686ad6ea53e4.gif)
![01-Oct-2014](https://user-images.githubusercontent.com/68249696/222123560-3e43f77b-d7dc-4242-8c11-7d2d5faa8ab4.gif)
