#!/bin/bash

# Create a separate directory for optimized output
mkdir -p optimized

# Array of program versions
versions=("hash-00" "hash-01" "hash-02" "hash-03" "hash-04")

# Loop through each program
for version in "${versions[@]}"
do
    echo "Running $version with optimization..."
    /usr/bin/time -f "%e real\t%U user\t%S sys\t%M memory (KB)" ./$version \
        > "optimized/${version}.txt" 2> "optimized/${version}.log"
done
