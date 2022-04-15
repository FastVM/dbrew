
const is_prime_from = function(x, n) {
    if (x < n * n) {
        return true;
    } else if (x % n != 0) {
        return is_prime_from(x, n+2);
    } else {
        return false;
    }
};

const is_prime = function(x) {
    if (x % 2 != 0) {
        return is_prime_from(x, 3);
    } else {
        return false;
    }
};

const main = function () {
    const max = 1000000;
    let res = 1;
    for (let n=3; n < max; n += 2) { 
        if (is_prime(n)) {
            res += 1;
        }
    }
    console.log(res);
}

main()