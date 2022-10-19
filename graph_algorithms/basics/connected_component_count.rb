require 'set'

def visit(graph, source, visited)
  visited << source
  graph[source].each do |node|
    visit(graph, node, visited) unless visited.include? node
  end
  visited
end

def count_connected_componets(graph)
  visited = Set.new
  count = 0
  graph.each do |key, value|
    unless visited.include? key
      visited = visit(graph, key, visited)
      count += 1
    end
  end

  count
end

graph =  {:i=>[:j, :k], :j=>[:i], :k=>[:i, :m, :l], :m=>[:k], :l=>[:k], :o=>[:n], :n=>[:o]}

p count_connected_componets(graph)