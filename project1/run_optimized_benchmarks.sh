#!/bin/bash

# Clean previous builds
make clean

# Rebuild with optimization enabled (-O2)
make OPT=-O2

# Create a directory to store optimized output
mkdir -p optimized

# Array of program versions
versions=("hash-00" "hash-01" "hash-02" "hash-03" "hash-04")

# Run each program and capture benchmark data
for version in "${versions[@]}"
do
    echo "Running $version with -O2 optimization..."
    /usr/bin/time -f "%e real\t%U user\t%S sys\t%M memory (KB)" ./$version \
        2> "optimized/${version}.log"
    cp "${version}.txt" "optimized/${version}.txt"
done

echo "Optimized runs complete."
