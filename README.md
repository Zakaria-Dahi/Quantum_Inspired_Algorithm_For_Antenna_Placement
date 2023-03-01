# Quick Description

**Programmers :shipit:**: Zakaria Abdelmoiz DAHI from the University of Malaga, Spain. 

**About:** This repositiory contains the implementation in [1] that studies the influence of the mapping functions when handling the binary antenna placement using a conitnuous swarm algorithm. We use instances of 14ç to 1000 antennas (representing the city of Malga, Spain) and three types of antennas (Omnidirectional, directional and Squared).

- [1] **Z.A. DAHI**, C. Mezioud, A. Draa, On the efficiency of the binary flower pollination algorithm: Application on the antenna positioning problem, Applied Soft  Computing, Volume 47, 2016, Pages 395-414, SSN 1568-4946, https://doi.org/10.1016/j.asoc.2016.05.051.

## **How :green_book:** 

- Depending on the variant you want to execute you just need to navigate to the corresponding foldr: `BFPAs` for the flower pollination algorithm and `PBIL` for the population-based incremental learning.
- Once you have navigated to the folder of the corresponding variant, you just need to execute the file `main.m`.


## **Folders Hiearchy :open_file_folder:**
    
- `BFPAs`:  this folder includes the binary variants of the flower pollination algorithm.

    - `AM`: This folder contains the variant using `Angle Modulation` mapping technique.
    - `GVP`: This folder contains the variant using `Great Value Priority` mapping technique.
    - `Nearest_Integer`: This folder contains the variant using `Nearest integer` mapping technique.
    - `Normalised`: This folder contains the variant using `Normalisation` mapping technique.
    - `Quantum`: This folder contains the variant using `Quantum Inspiration`.
    - `Sigmoid`: This folder contains the variant using `Sigmoid` mapping technique.
- `PBIL`: This folder contains the code of the `Populatio-Based Incremental Learning`. 

- `Results`: 
    - `Graphical`: the results will be automatically stored as `gif` figures.
    - `Nurmerical`: the results will be stored as `Excel` files with name as `instance_shape.xls`, where `instance` is the size of the benchmarks (i.e. the number of candidate Antennas) and `shape` is the shape of the antenna being using. The size ranges from 149 to 1000 candidate antennas, while for the shapes we use omnidirectional, directional and rectangular. 
        
## **Demo :movie_camera:**
    
- Please refer to the original paper [HERE](https://www.sciencedirect.com/science/article/pii/S1568494616302617) for more detailed results and discussions.

![08-Oct-2014](https://user-images.githubusercontent.com/68249696/222123414-ef9b0af1-1271-42f1-992c-050d05295fc1.gif)
![05-Apr-2014_174 9807](https://user-images.githubusercontent.com/68249696/222123453-52043b21-bfaa-44d7-8470-7eff65d914ea.gif)
![01-Nov-2014](https://user-images.githubusercontent.com/68249696/222123511-c42c8f57-a4e6-4ce9-9e29-686ad6ea53e4.gif)
![01-Oct-2014](https://user-images.githubusercontent.com/68249696/222123560-3e43f77b-d7dc-4242-8c11-7d2d5faa8ab4.gif)
