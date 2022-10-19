# Write a function, island_count, that takes in a grid containing Ws and Ls. 
# W represents water and L represents land. 
# The function should return the number of islands on the grid. 
# An island is a vertically or horizontally connected region of land.
# https://structy.net/problems/island-count'

require 'set'

grid = [
  ['W', 'L', 'W', 'W', 'W'],
  ['W', 'L', 'W', 'W', 'W'],
  ['W', 'W', 'W', 'L', 'W'],
  ['W', 'W', 'L', 'L', 'W'],
  ['L', 'W', 'W', 'L', 'L'],
  ['L', 'L', 'W', 'W', 'W'],
];

def explore(grid, start, visited)
  x,y = start
  return false if visited.include?(start) || grid[x][y] == 'W'
  rows = grid.count
  columns = grid[0].count

  visited << start
  
  explore(grid, [x, y-1], visited) if y > 0 # up
  explore(grid, [x, y+1], visited) if y < columns -1 # down
  explore(grid, [x-1, y], visited ) if x > 0 # left
  explore(grid, [x+1, y], visited) if x < rows -1 # left

  return true
end

def island_count(grid)
  count = 0
  visited = Set.new
  grid.each_with_index do |row, x| 
    row.each_with_index do |value, y|
      unless value == 'W' || visited.include?([x,y])
        count += 1 if explore(grid, [x,y], visited)
      end
    end
  end

  count
end

p island_count(grid)
