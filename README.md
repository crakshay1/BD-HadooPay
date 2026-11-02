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
Scripts/                       # Scripts used to set up the environment and run the MapReduce jobs
db/                            # Data folder (the main file, purchases.txt, is NOT available)
BIGDATA-Report2-Akshay.pdf     # Project report
```
