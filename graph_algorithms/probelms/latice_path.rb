def count_path(rows, columns)
  p explore([0,0], [rows, columns])
end

def explore(start, dest, explored={})  
  return 1 if start == dest
  return explored[start] unless explored[start].nil?
  
  x, y = start
  count = 0
  count += explore([x + 1,y], dest, explored) if x < dest[0]
  count += explore([x, y+1], dest, explored) if y < dest[1]
  explored[start] = count
  count
end

count_path(20, 20)