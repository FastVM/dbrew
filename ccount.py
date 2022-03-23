
import random

n = 1000000

for i in range(n):
    print(f"int f{i}(int v{i}) {{return ", end='')
    r = 0
    j = 1
    while j < i:
        print(f"f{j}(",end='')
        j += i % j + 1
        r += 1
    print(f"v{i}",end='')
    for j in range(r):
        print(")",end='')
    print(f";}}")

print(f"int main() {{return 0;}}")