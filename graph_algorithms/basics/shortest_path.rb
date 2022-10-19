edges = [
  ['w', 'x'],
  ['x', 'y'],
  ['z', 'y'],
  ['z', 'v'],
  ['w', 'v']
];

def edges_to_adjecency(edges)
  graph = {}
  edges.each do |start, ending|
    graph[start] = (graph[start] || []) << ending
    graph[ending] = (graph[ending] || []) << start
  end
  graph
end

graph = edges_to_adjecency(edges)

def shortest_path(graph, source, dest)
  return 0 if source == dest
  queue = [[source, 0]]
  while queue.any?
    current, distance = queue.pop
    return distance if current == dest
    queue.unshift(*graph[current].map{|node| [node, distance+1] })
  end
end

p shortest_path(graph, 'w', 'z')
