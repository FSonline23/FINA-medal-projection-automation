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
