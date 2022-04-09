
local function is_prime_from(x, n)
    if x < n * n then
        return true
    elseif x % n ~= 0 then
        return is_prime_from(x, n+2)
    else
        return false
    end
end

local function is_prime(x)
    if x % 2 ~= 0 then
        return is_prime_from(x, 3)
    else
        return false
    end
end

local function main()
    local max = 1000000
    local res = 2
    for n=3, max, 2 do
        if is_prime(n) then
            res = res + n
        end
    end
    print(res)
end

main()