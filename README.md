###Introduction

The data for this assignment come from the Hospital Compare web site [http://hospitalcompare.hhs.gov](http://hospitalcompare.hhs.gov)
run by the U.S. Department of Health and Human Services. The purpose of the web site is to provide data and
information about the quality of care at over 4,000 Medicare-certified hospitals in the U.S. This dataset essentially 
covers all major U.S. hospitals. This dataset is used for a variety of purposes, including determining
whether hospitals should be fined for not providing high quality care to patients.  
This assignment contains three files:
* <b>outcome-of-care-measures.csv:</b> Contains information about 30-day mortality and readmission rates
for heart attacks, heart failure, and pneumonia for over 4,000 hospitals.
* <b>hospital-data.csv:</b> Contains information about each hospital.
* <b>Hospital_Revised_Flatfiles.pdf:</b> Descriptions of the variables in each file (i.e the code book).

### Assignment

<b>1. Plot the 30-day mortality rates for heart attack </b>

<b>2. Find the best hospital in a state </b>: Involves writing a function called <b>best</b> that takes two arguments: the 2-character abbreviated name of a state and an
outcome name. The function reads the outcome-of-care-measures.csv file and returns a character vector
with the name of the hospital that has the best (i.e. lowest) 30-day mortality for the specied outcome
in that state. The hospital name is the name provided in the Hospital.Name variable. The outcomes can
be one of "heart attack", "heart failure" or "pneumonia". Hospitals that do not have data on a particular
outcome should are excluded from the set of hospitals when deciding the rankings.  
<i>Handling ties</i>: If there is a tie for the best hospital for a given outcome, then the hospital names are sorted in alphabetical order and the first hospital in that set is chosen.  

<b>Sample output</b>  

> source("best.R")  
> best("TX", "heart attack")  
[1] "CYPRESS FAIRBANKS MEDICAL CENTER"  
> best("TX", "heart failure")  
[1] "FORT DUNCAN MEDICAL CENTER"  
> best("MD", "heart attack")  
[1] "JOHNS HOPKINS HOSPITAL, THE"  
> best("MD", "pneumonia")  
[1] "GREATER BALTIMORE MEDICAL CENTER"  
> best("BB", "heart attack")  
Error in best("BB", "heart attack") : invalid state  
> best("NY", "hert attack")  
Error in best("NY", "hert attack") : invalid outcome  

Code saved for this function to a file named <b><i>best.R</i></b>

<b>3. Ranking hospitals by outcome in a state</b>: Involves writing a function called <b>rankhospital</b> that takes three arguments: the 2-character abbreviated name of a
state (state), an outcome (outcome), and the ranking of a hospital in that state for that outcome (num).
The function reads the outcome-of-care-measures.csv file and returns a character vector with the name
of the hospital that has the ranking specified by the num argument. For example, the call
rankhospital("MD", "heart failure", 5) would return a character vector containing the name of the hospital with the 5th lowest 30-day death rate
for heart failure. The num argument can take values "best", "worst" or an integer indicating the ranking (smaller numbers are better).   
<i>Handling ties</i>: It may occur that multiple hospitals have the same 30-day mortality rate for a given cause
of death. In those cases ties should be broken by using the hospital name.  

<b>Sample output</b>  

> source("rankhospital.R")  
> rankhospital("TX", "heart failure", 4)  
[1] "DETAR HOSPITAL NAVARRO"  
> rankhospital("MD", "heart attack", "worst")  
[1] "HARFORD MEMORIAL HOSPITAL"  
> rankhospital("MN", "heart attack", 5000)  
[1] NA  

Code saved for this function to a file named <b><i>rankhospital.R</i></b>

<b>4. Ranking hospitals in all states</b>: Involves writing a function called <b>rankall</b> that takes two arguments: an outcome name (outcome) and a hospital ranking (num). The function reads the outcome-of-care-measures.csv file and returns a 2-column data frame 
containing the hospital in each state that has the ranking specified in num. For example the function call
rankall("heart attack", "best") would return a data frame containing the names of the hospitals that
are the best in their respective states for 30-day heart attack death rates. The function should return a value
for every state (some may be NA). The first column in the data frame is named hospital, which contains
the hospital name, and the second column is named state, which contains the 2-character abbreviation for
the state name. Hospitals that do not have data on a particular outcome should be excluded from the set of
hospitals when deciding the rankings.  
<i>Handling ties</i>: The rankall function should handle ties in the 30-day mortality rates in the same way
that the rankhospital function handles ties.  

The function should check the validity of its arguments. If an invalid outcome value is passed to rankall,
the function should throw an error via the stop function with the exact message "invalid outcome". The num
variable can take values "best", "worst", or an integer indicating the ranking (smaller numbers are better).
If the number given by num is larger than the number of hospitals in that state, then the function should
return NA.  

Code saved for this function to a file named <b><i>rankall.R</i></b>