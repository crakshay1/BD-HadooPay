# BD-HadooPay

**Evaluating Hadoop MapReduce in a Docker container for Purchase Data**  
*Cloud Computing & Big Data — Université Paris-Saclay*

-----------------------------------------------------
This project is a hands-on evaluation of Hadoop MapReduce, deployed inside a Docker container. It revolves around a dataset of purchases (`purchases.txt`) that is meant to be processed with MapReduce jobs in order to compute simple aggregations over the transactions.

The goal is to get familiar with the MapReduce programming model and the Hadoop ecosystem, in an isolated and reproducible environment thanks to Docker.

-------
## Important note: main dataset unavailable
The main database of this project, `purchases.txt`, is **not accessible**: it is not included in this repository. As a consequence, the MapReduce jobs cannot be re-run as-is from this repo. To reproduce the experiments, you need to obtain a compatible `purchases.txt` file and place it in the expected location (see [Structure](#structure)). The results obtained with the original dataset are described in the report.

## Report
You can find the description of the work, the MapReduce jobs and the results in the [BIGDATA-Report2-Akshay.pdf](https://github.com/crakshay1/BD-HadooPay/blob/main/BIGDATA-Report2-Akshay.pdf).

## Tech stack
* Hadoop
* Docker

## Structure

```
.
├── BIGDATA-Report2-Akshay.pdf     # Project report
└──  db/                            # Data files
    ├── purchases.txt              # Main purchases database (NOT accessible)
    ├── city.txt                   # City data
    ├── date.txt                   # Date data
    ├── item.txt                   # Item / product category data
    ├── payment.txt                # Payment method data
    ├── time.txt                   # Time of purchase data
    ├── pd.txt                     # Additional data file
    └── projet2.txt                # Additional data file for the project
└──  Scripts/                       # Scripts to run and analyze the MapReduce jobs
    ├── all_coms.sh                # Shell script gathering the commands to run the jobs
    ├── proj2.r                    # R script for the analysis of the results
    ├── Initial_MapReduce/         # First MapReduce job
    │   ├── mapper.py
    │   └── reducer.py
    ├── Purchase 2.0/              # Second version of the job
    │   ├── mapper1.py
    │   └── reducer.py
    ├── Purchase 2.2/              # Refined version of the second job
    │   ├── mapper.py
    │   └── reducer1.py
    └── Purchase 3.0/              # Third version of the job
        ├── mapper2.py
        └── reducer2.py
```
