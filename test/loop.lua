local function loop(n, k)
    if n ~= 0 then
        return loop(n-1, k+2)
    else
        return k
    end
end

print(loop(1000000001, 0) % 10)