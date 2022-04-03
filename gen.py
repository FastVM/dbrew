
print("(sub x y) ?")
print("(add x y) ?")
print("(lt x y) ?")

for i in range(1, 100000):
    print(f"(fib{i} n) if lt 2 n n let n1 sub 1 n add fib{i} n1 fib{i} sub 1 n1")

print("(main) 0")
