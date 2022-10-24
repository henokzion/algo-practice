def count_path(n)
  latice = (0..n).map{|i| (0..n).map{ 0 }}
  latice[0][0] = 1

  latice.each_with_index do |row, x|
    row.each_with_index do |column, y|
      latice[x+1][y] += latice[x][y] unless latice[x+1][y].nil?
      latice[x][y+1] += latice[x][y] unless latice[x][y+1].nil?
    end
  end
  latice.last.last
end

p count_path(20)