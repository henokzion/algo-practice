def depth_first(graph, source)
  stack = [source]
  while stack.any?
    current = stack.pop
    p current
    stack.push(*graph[current])
  end
end

def depth_first_reccursive(graph, source)
  p source
  graph[source].each do |node|
    depth_first_reccursive(graph, node)
  end
end

def breadth_first(graph, source)
  queue = [source]
  while queue.any?
    current = queue.pop
    p current
    queue.unshift(*graph[current])
  end
end

graph = {
  a: [:b, :c],
  b: [:d],
  c: [:e],
  d: [:f],
  e: [],
  f: []
}

depth_first(graph, :a)
depth_first_reccursive(graph, :a)
breadth_first(graph, :a)
