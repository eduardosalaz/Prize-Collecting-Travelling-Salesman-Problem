# Prize-Collecting-Travelling-Salesman-Problem
 
This repo is focused on solving the prize collecting travelling salesman problem with two constructive heuristics.

## Procedure

For the inputs used in the heuristics, a file names generator.jl is executed with respective parameters to generate a set of cities.

The one shown in the heuristic_1.jl file is based on a Nearest Neighbor-type approach.

As for the one in the heuristic_2.jl file is based the Cheapest Insertion heuristic.

Both heuristics use minimum_profit.jl to calculate the minimum profit to be used in the while loop.

A local search swap-move is executed in local_search.jl. This is applied to both heuristics to try to improve the given results.

Afterwards, experimental_results.jl is executed to store the results into a dataframe which is exported into a .txt file named `results.txt`. The columns in said dataframe are the following:

| Iteration | H1 Total Travel Cost | H1 Recollected Prize | H1 Prize/Cost Ratio | H1 Local Search Total Travel Cost | Improved? H1 | H2 Total Travel Cost | H2 Recollected Prize | H2 Prize/Cost Ratio | H2 Local Search Total Travel Cost | Improved? H2 |
| ------------- | ------------- | ------------- | ------------- | ------------- | ------------- | ------------- | ------------- | ------------- | ------------- | ------------- |

This is all executed n times for the given iterations.

### Previous configuration

The following Julia version must be installed for this code to work:

```
julia v"1.9.3"
```

And the following libraries must be installed and added:

```
- DotEnv v0.3.1
- DelimitedFiles v1.9.1
- DataFrames v1.6.1
- Statistics v1.9.0
- Gadfly v1.4.0
- Cairo v1.0.5
- Fontconfig v0.4.1
```

To install any missing libraries, execute the following lines of code at the beginning of the procedure:
```
import Pkg; Pkg.add("library")
```

### Environmental variables

The parameters used for the x and y axis positions as well as prizes were based on the proposition by Dell’Amico, M. et. al.:

``` textplain
GENERATED_FILE="cities"
MIN_AXIS=0
MIN_PRIZE=0
MAX_AXIS=1000
MAX_PRIZE=100
QUANTITY_CITIES=60
ALPHA=.3
ITERATIONS=20
```

### Alpha

For each amount of cities used in the experiments, here are the values for Alpha in each respective instance specification.
Alpha is used for the minimum profit calculation in each constructive heuristic.

| # of cities  | Alpha |
| ------------- | ------------- |
| 60  | .3  |
| 400  | .6  |
| 5000  | .9  |

## References

[1] Dell’Amico, M., Maffioli, F. & Sciomachen, A. A Lagrangian heuristic for the
Prize Collecting Travelling Salesman Problem. Annals of Operations Research
81, 289–306 (1998). https://doi.org/10.1023/A:1018961208614
