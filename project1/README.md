
project 1 repository contains the un-optomized output
the optomized directory/repository idk inside the project 1 repository contains the optimized output



## Project one.

Levi Hicks && Jefferson Pinargote



Un-optomized

make            # default: OPT=-g

Hash 0:
350.01 real	339.02 user	4.64 sys	2896 memory (KB)

Hash 1:
21.96 real	16.87 user	2.22 sys	2912 memory (KB)


Hash 2:
16.74 real	14.28 user	1.24 sys	2912 memory (KB)

Hash 3:
16.36 real	15.09 user	1.13 sys	2900 memory (KB)

Hash 4:
14.39 real	13.78 user	0.42 sys	5006608 memory (KB)




Optomized
-O2

Hash 0:
347.20 real	332.45 user	10.33 sys	2880 memory (KB)

Hash 1:
10.64 real	6.99 user	1.64 sys	2880 memory (KB)

Hash 2:
10.98 real	6.98 user	1.35 sys	2880 memory (KB)

Hash 3:
7.99 real	6.62 user	1.22 sys	2880 memory (KB)

Hash 4:
7.13 real	6.58 user	0.48 sys	5012352 memory (KB)


# Project 1 Performance Report

## Benchmark Results

| Program  | Optimization | Real Time (s) | User Time (s) | Sys Time (s) | Memory (KB) | Throughput (hashes/sec) | Improvement vs hash-00 |
|----------|--------------|---------------|---------------|--------------|-------------|---------------------------|-------------------------|
| hash-00  | -g           | 350.01        | 339.02        | 4.64         | 2896        | 2,857.06                  | 1.00                    |
| hash-01  | -g           | 21.96         | 16.87         | 2.22         | 2912        | 45,537.34                 | 15.94                   |
| hash-02  | -g           | 16.74         | 14.28         | 1.24         | 2912        | 59,737.16                 | 20.91                   |
| hash-03  | -g           | 16.36         | 15.09         | 1.13         | 2900        | 61,124.69                 | 21.39                   |
| hash-04  | -g           | 14.39         | 13.78         | 0.42         | 5,006,608   | 69,492.70                 | 24.32                   |
| hash-00  | -O2          | 347.20        | 332.45        | 10.33        | 2880        | 2,880.58                  | 1.00                    |
| hash-01  | -O2          | 10.64         | 6.99          | 1.64         | 2880        | 93,985.64                 | 32.63                   |
| hash-02  | -O2          | 10.98         | 6.98          | 1.35         | 2880        | 91,064.66                 | 31.61                   |
| hash-03  | -O2          | 7.99          | 6.62          | 1.22         | 2880        | 125,140.17                | 43.44                   |
| hash-04  | -O2          | 7.13          | 6.58          | 0.48         | 5,012,352   | 140,234.51                | 48.70                   |


## 1) What operation do you think accounts for most of hash-00's runtime?

We think most of hash-00’s runtime is spent reading and parsing the Data.txt file. Since it’s an ASCII file, the program has to convert strings into numbers one by one for every piece of data. That takes way more time than just reading raw binary data like the other versions do. This version is basically slowed down by how it handles input.



## 2) hash-01 and hash-02 both dynamically allocate memory for each hash computation.  Is there much difference time-wise between their two allocation methods?

We noticed that hash-02 was a little faster than hash-01 when I ran them without optimizations. This makes sense since hash-02 uses alloca() to allocate memory on the stack, which is faster than using new[] on the heap like hash-01 does. But once we ran both with -O2, the speed difference mostly disappeared. So while stack allocation might be faster in theory, the compiler optimizations kind of leveled the playing field.



## 3) hash-03 avoids the allocation by using a fixed-size array.  Is there an appreciable speed difference?

Yeah, we saw a definite speed boost with hash-03. Since it just reuses one big array and doesn’t allocate memory over and over, it runs faster — especially when compiled with -O2. It was the fastest of all the versions that didn’t use memory mapping. So yeah, not having to allocate memory every time really makes a difference.


## 4) Why is hash-04's memory usage so much larger than any of the other versions?

hash-04 uses memory-mapped I/O to load the entire binary file into memory at once. So instead of reading chunks like the other versions, the OS maps the full file into the program’s address space. That’s why the memory usage looks way higher — because the whole file is technically in memory at once. The tradeoff is that it runs really fast since it avoids extra reads, but it comes at the cost of high memory usage.

## 5) What other compiler options did you try, and did they help at all?

We stuck with the two main compiler flags: -g for unoptimized builds, and -O2 for optimized ones. I didn’t try any others like -O3 or -Ofast, but even just switching from -g to -O2 made a big difference in runtime performance, especially for versions like hash-03 and hash-04.


