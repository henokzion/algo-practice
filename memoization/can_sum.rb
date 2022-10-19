def can_sum?(target, numbers, memo={})
  return true if target == 0
  return false if target < 0
  return memo[target] unless memo[target].nil?
  numbers.each do |number|
    can = can_sum?(target - number, numbers, memo)
    if can
      memo[target] = true  
     return true
    end
  end
  memo[target] = false
  false
end

p can_sum?(300, [7, 14])