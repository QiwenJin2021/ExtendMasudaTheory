# ExtendMasudaTheory
Extension of Masuda theory adopted by ISO 13322-1:2014

Userguide of MDErrorCalculator tool

1. Download link

https://github.com/QiwenJin2021/ExtendMasudaTheory

2. Compilation environment

The developed tool was compiled and tested using MATLAB R2021b.

3. Usage

A. Calculate required sample size with known distribution parameter

(1) Input parameters. The default confidence level is set to 0.95. Users need to input the geometric standard deviation GSD and the allowable error limit, and select the type of mean particle diameter. 

(2) Click :Calculate button”. Then the required sample size N* is ontained.
 

B. Calculate real-time error of a loading size data

(1) Input parameters. The default confidence level is set to 0.95. Users need to input the the allowable error limit, and select the type of mean particle diameter.

(2) Load data. The input data should consist of a single-column particle size dataset, and the file format must be Excel (.xlsx). Click “Load data” button to import size data.

(3) Click “Analysis” button. The software will perform distribution fitting and calculate the corresponding error results at intervals of Ninterval samples. Both the particle size distribution fitting results and the error evaluation results will be displayed in the right-hand panel. Finally, the software will provide a decision on whether the sample size is sufficient, i.e., “Enough” or “Not Enough”.
 

