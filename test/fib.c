
int printf(const char *fmt, ...);

int fib(int n) {
    if (n < 2) {
        return n;
    } else {
        return fib(n-2) + fib(n-1);
    }
}

int main() {
    printf("%i\n", fib(45));
    return 0;
}
