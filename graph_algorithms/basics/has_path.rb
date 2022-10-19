graph = {
  a: [:b, :c],
  b: [:d],
  c: [:e],
  d: [:f],
  e: [],
  f: []
}

# depth first
def has_path(graph, source, dest)
  return true if source == dest
  graph[source].each do |neigbour|
    return true if has_path(graph, neigbour, dest)
  end

  false
end

# breadth first
def has_path_2(graph, source, dest)
  return true if source == dest
  queue = [source]
  while queue.any?
    current = queue.pop
    return true if current == dest
    queue.unshift(*graph[current])
  end

  false
end

p has_path(graph, :a, :f)
p has_path_2(graph, :a, :f)
