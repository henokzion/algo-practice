def how_sum?(target, numbers, memo={})
  return [] if target == 0
  return nil if target < 0
  return memo[target] if memo.key? target

  shortest = nil

  numbers.each do |number|
    result = how_sum?(target - number, numbers, memo)
    unless result.nil?
      com = [*result, number]

      if shortest.nil? || com.length < shortest.length 
        shortest = com
      end
    end
  end

  # memo[target] = nil
  memo[target] = shortest
  shortest
end

p how_sum?(100, [1,14,20,25])