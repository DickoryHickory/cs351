#!/bin/bash

# Array of program versions
versions=("hash-00" "hash-01" "hash-02" "hash-03" "hash-04")

# Loop through each program
for version in "${versions[@]}"
do
    echo "Running $version..."
    /usr/bin/time -f "%e real\t%U user\t%S sys\t%M memory (KB)" ./$version 2> "${version}.log"
done

echo "All runs complete."
