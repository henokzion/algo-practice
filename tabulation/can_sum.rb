def can_sum?(target, numbers)
  tabu = [false] * target
  tabu.unshift(true)
  tabu.each_with_index do |can, index|
    if can
      numbers.each do |num|
        tabu[index + num] = true unless tabu[index + num].nil?
      end
    end
  end

  tabu.last
end

p can_sum?(300, [1, 7, 14])