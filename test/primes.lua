
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
    local max = 2000000
    print(2)
    for n=3, max, 2 do
        if is_prime(n) then
            print(n)
        end
    end
end

main()