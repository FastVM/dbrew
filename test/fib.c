int putchar(int c);

void putd(int d) {
    putchar(d % 10 + '0');
}

void putn(int n) {
    if (9 < n) {
        putn(n / 10);
        putd(n);
    } else {
        putd(n);
    }
}

int fib(int n) {
    if (n < 2) {
        return n;
    } else {
        return fib(n - 2) + fib(n - 1);
    }
}

int main() {
    putn(fib(35));
    putchar('\n');
}
