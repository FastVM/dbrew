
#include <stddef.h>
#include <stdio.h>

typedef size_t number_t;

static number_t is_prime(number_t x) {
    if (x % 2 != 0) {
        for (number_t n = 3; n * n <= x; n+=2) {
            if (x % n == 0) {
                return 0;
            }
        }
        return 1;
    } else {
        return 0;
    }
}


int main() {
    number_t max = 1000000;
    number_t res = 2;
    for (number_t n = 3; n < max; n += 2) {
        if (is_prime(n)) {
            res += n;
        }
    }
    printf("%zu\n", res);
    return 0;
}