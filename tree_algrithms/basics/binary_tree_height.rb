class Node
  attr_accessor :val, :left, :right
  def initialize(val=nil)
      @val = val
      @left = nil
      @right = nil
  end
end

class Tree
  attr_accessor :root
  def initialize
      @root = Node.new
  end
  
  def insert val, node=@root
      return node.val = val unless node.val
      if val > node.val
          if node.right
              insert(val, node.right)
          else
              node.right = Node.new(val)
          end
      else
          if node.left
              insert(val, node.left) 
          else 
              node.left = Node.new(val)
          end
      end
  end
end

def getHeight(tree)
  queue = [[tree.root, 0]]
  max_distance = 0
  while queue.any?
      current, distance = queue.pop
      max_distance = max_distance < distance ? distance : max_distance
      queue << [current.left, distance + 1 ] if current.left
      queue << [current.right, distance + 1 ] if current.right
  end
  
  max_distance
end

tree = Tree.new
t = gets.strip.to_i
nodes = gets.chomp.split(" ").map(&:to_i)

nodes.each do |node|
  tree.insert node
end

p getHeight(tree)
