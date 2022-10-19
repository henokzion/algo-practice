def how_sum?(target, numbers, memo={})
  return [] if target == 0
  return nil if target < 0
  return memo[target] if memo.key? target
  arrays = numbers.map do |number|
    result = how_sum?(target - number, numbers, memo)
    unless result.nil?
      memo[target] = [*result, number]
      [memo[target], memo[target].length]
    end
  end

  arrays = arrays.compact!  
  if arrays && arrays.any?
    return arrays.sort_by(&:length).first.first
  end

  memo[target] = nil
  nil
end

p how_sum?(100, [1,14,20,25])