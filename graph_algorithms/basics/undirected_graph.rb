require 'set'
edges = [
  [:i, :j],
  [:k, :i],
  [:m, :k],
  [:k, :l],
  [:o, :n]
]

def edges_to_adjecency(edges)
  graph = {}
  edges.each do |start, ending|
    graph[start] = (graph[start] || []) << ending
    graph[ending] = (graph[ending] || []) << start
  end
  graph
end

graph = edges_to_adjecency(edges)

def has_path(graph, source, dest, visited=Set.new)
  return true if source == dest
  visited << source
  graph[source].each do |node|
    unless visited.include?(node)
      return true if has_path(graph, node, dest, visited)
    end
  end
  false
end

p has_path(graph, :i, :l)
