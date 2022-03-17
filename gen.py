
print("(add x y) ?")
print("(sub x y) ?")
print(f"(f0 x) x")

for i in range(1, 100000):
    print(f"(f{i} x) sub 1 f{i-1} add 1 {i}")

print("(main) 0")
