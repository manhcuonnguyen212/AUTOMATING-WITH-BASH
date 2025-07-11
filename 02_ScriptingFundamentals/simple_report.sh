#!/usr/bin/bash
# Description: print formatted report

## Build a long string of equal signs
divider======================
divider=$divider$divider

## Format strings for printf
header="\n %-10s %11s %8s %10s \n"
format="%-10s %11.2f %8d %10.2f\n"

## Width of divider
totalwidth=44

## Print categories
printf "$header" ITEM "PER UNIT" NUM TOTAL

## Print divider to match width of report
printf "%${totalwidth}.${totalwidth}s\n" "$divider"

## Print lines of report 
printf "$format" \ 
    Chair 79.95 4 319.8 \ 
   Table  209.99 1 209.99 \ 
   Armchair 315.49 2 630.98 \
