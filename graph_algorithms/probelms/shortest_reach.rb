# Enter your code here. Read input from STDIN. Print output to STDOUT
require 'set'

number_of_queries = gets.chomp.to_i
graphs = []

number_of_queries.times do |i|
  n, m = gets.chomp.split(' ').map(&:to_i) # n number of nodes, m number of edges
  graph = {}
  
  graph[:nodes] = (1..n).to_a.each_with_object(Hash.new(0)) do |item, hash|
    hash[item] = []
  end
  
  m.times do
    start, ending = gets.chomp.split.map(&:to_i)
    graph[:nodes][start] << ending
    graph[:nodes][ending] << start
  end

  graph[:start] = gets.chomp.to_i
  graphs << graph
end

def shortest_path(graph, source)
  distances = {}
  queue = [[source, 0]]
  while queue.any?
    current, distance = queue.pop

    distances[current] = distances[current] && distances[current] < distance ? distances[current] : distance

    graph[current].each do |node|
      if distances[node].nil?
        queue.unshift([node, distance+6])
      end
    end
  
  end

  distances
end

graphs.each do |graph|
  nodes = graph[:nodes]
  start = graph[:start]
  
  distances = shortest_path(nodes, start)

  paths = nodes.keys.map do |key|
    if key != start
      if distances[key]
        distances[key]
      else
        -1
      end
    end
  end
  puts paths.compact.join(" ")
end
