#!/bin/sh

# change to non-root user
#su - shiny

# R install packages using a scritp  located under this dir
cd /home/shiny

#create empty file 
touch check_library.R
echo "library(shiny)" > check_library.R

# check  if shiny library  is installed, if not output will be something like
# Error in library(stringi) : there is no package called ‘stringi’ Execution halted
package_installed=$(R --no-save < check_library.R  2>&1 > /dev/null)
error_msg="Error in library"

# if package shiny is not installed , it means this is the first time running this container
# thus install all packages

if echo "${package_installed}" | grep -q "$error_msg"; then
   echo "Package shiny not installed, try to install it..."

   #. install R packages 
  ./rpackageinstall RPostgreSQL &&  ./rpackageinstall dplyr && ./rpackageinstall shinymanager && ./rpackageinstall shiny 
    # start the app
   R --no-save < farmac.R
else
  # start the app
  R --no-save < farmac.R
fi



