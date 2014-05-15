def fizzbuzz(n)
  return if n == 50
  if n % 3 == 0
    puts "fizz"
    fizzbuzz(n+1)
  elsif n % 5 == 0
    puts "buzz"
    fizzbuzz(n+1)
  else
    puts n
    fizzbuzz(n+1)
  end
end

def exp(a,b)
  if b == 1
    return a
  end
  a * exp(a, b-1)
end

p exp(2,3)
