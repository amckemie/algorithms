def countdown(x)
  return if x < 0
  puts x
  countdown(x-1)
end
