
#include <stddef.h>
#include <stdio.h>

size_t is_prime_from(size_t x, size_t n) {
    if (x < n * n) {
        return 1;
    } else if (x % n != 0) {
        return is_prime_from(x, n+2);
    } else {
        return 0;
    }
}

size_t is_prime(size_t x) {
    if (x % 2 != 0) {
        return is_prime_from(x, 3);
    } else {
        return 0;
    }
}


int main() {
    size_t max = 1000000;
    size_t res = 2;
    for (size_t n = 3; n < max; n += 2) {
        if (is_prime(n)) {
            res += n;
        }
    }
    printf("%zu\n", res);
    return 0;
}