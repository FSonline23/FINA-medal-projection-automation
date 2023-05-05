# **Documentation**

This R script is to automate the processes of medal projection for FINA results collected after running <a href="https://github.com/FSonline23/FINA-data-collection">FINA-data-collection/script.py</a>. 2 CSVs will be outputed (1 for the results of Shapiro Wilk's normality tests, 1 for compiling the datasets to be used for simulation)

<hr>

## **Requirements (Installation)**

Change into current directory and run R install.packages() to install the required packages using the following command.

<pre><code>install.packages(c("tidyverse", "ggplot2", "readxl", "chron", "lubridate", "optparse"))</code></pre>
<hr>

## **Running the Script**

Ensure that R is installed and added to environment path before proceeding. In your terminal or your preferred CLI, Change into directory of normality_test.R script and run the following command.

<pre><code>Rscript normality_test.R -f INPUT_TARGET_EXCEL_FILE_NAME_HERE</code></pre>

If target excel file name is not specified, the <u>first excel file (.xlsx)</u> that script can find will be used. Hence if there is only one excel file in the directory, this following command with no argument will be sufficient:

<pre><code>Rscript normality_test.R</code></pre>

### **Help on Script**

Run the following command to see help and arguments for the script.

<pre><code>Rscript normality_test.R -h</code></pre>
<hr>

### **What does the script do?**

The script will perform automated normality testing using shapiro wilk function in dplyr library. User can parse in an excel file (.xlsx) to run automation, if not specified, script will use the first excel file it encounters in the directory. For each unqiue athlete extracted from "Competitors 2019-2023" worksheet in the excel file parsed, the script will loop through and perform normality testing. The dataset order used will start from "Competitor 2023", followed by "Competitor 2022-2023" & finally "Competitor 2019-2023". If there is not enough data points or p-value is lesser than 0.05, the script will advance to the next dataset. 2 files will be outputted (shapiroTest.csv & dataset.csv). 1 containing the final overall dataset used for normality testing and a csv containing shapiro testing results [p-values, dataset used, total datapoints, datapoints used, remarks]. If -c [--compileOutput] argument is parsed, output will be automated to move into "Completed" folder located in the directory.
