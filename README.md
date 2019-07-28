# README

Materials for BioStimApp Shiny application for evaluating biostimulatory options for CSCI

#### Methods

1. In the thresholds dataframe
    1.	Identify validated targets where both RR.l95.cal and RR.l95.val>1.
    1.	Ask user for BS factors (TN TP Chl-a AFDM, % cover), BI indices (CSCI, ASCI H/D/S) of interest
    1.	Ask user for BIgoal (Ref01, Ref10, Ref30, BCG4, BCG3) and associated probability level (80, 90, 95)
    1.	Identify lowest validated targets for relevant factors based on relevant indices
    1.	SHOW THE RESULTING TARGETS!
1. In the data dataframe (mydf.3)
    1.	Subset out Selected, split Cal/VAL
    1.	Compare BS factors to selected targets
    1.	Compare BI index scores to selected goals (need bi thresholds dataframe)
    1.	[Let’s just assume we show a simple application of these targets, and that all BI indices should meet goals to indicate success]
    1.	Classify sites as meeting ALL BI goals vs. failing ANY.
    1.	Identify all possible combos of meeting/not meeting BS targets
    1.	Count up number of cases in each combo
    1.	Calculate % sites meeting all BI goals for each combo
    1.	Ask how to sort:
         *	Original
         *	By decreasing % passing (CAL)
         *	By decreasing number of targets met (ones/twos/threes)
1.	Magically make the plot
    1.	Hard-code confidence: (Based on binomial power/confidence?)
    1.	[Consider color-coding errors/successes]
    1.	Use points instead of bars
