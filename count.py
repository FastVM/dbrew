
import random

n = 1000000

for i in range(n):
    print(f"(f{i} v{i})", end=' ')
    j = 1
    while j < i:
        print(f"f{j}", end=' ')
        j += i % j + 1
    print(f"v{i}")

print(f"(main) 0")