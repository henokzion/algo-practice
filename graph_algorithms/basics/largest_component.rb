require 'set'

graph = {
  0 => [8, 1, 5],
  1 => [0],
  5 => [0, 8],
  8 => [0, 5],
  2 => [3, 4],
  3 => [2, 4],
  4 => [3, 2]
}

require 'set'

def visit(graph, source, visited=Set.new)
  visited << source
  graph[source].each do |node|
    visit(graph, node, visited) unless visited.include? node
  end
  [visited, visited.length]
end

def largest_component graph
  visited = Set.new
  max_length = 0
  graph.each do |key, value|
    unless visited.include? key
      component, count = visit(graph, key)
      visited = visited + component
      max_length = max_length > count ? max_length : count
    end
  end

  max_length
end

p largest_component(graph)
