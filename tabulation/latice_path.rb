def count_path(n)
  latice = (0..n).map{|i| (0..n).map{ 0 }}
  latice[0][0] = 1

  latice.each_with_index do |row, x|
    row.each_with_index do |column, y|
      if x < n && y < n
        latice[x+1][y] += latice[x][y]
        latice[x][y+1] += latice[x][y]
      elsif x < n
        latice[x+1][y] += latice[x][y]
      elsif y < n
        latice[x][y+1] += latice[x][y]
      end
    end
  end
  latice.last.last
end

p count_path(20)