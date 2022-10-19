# Enter your code here. Read input from STDIN. Print output to STDOUT
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

def transverse(tree)
  queue = [tree.root]
  nodes = []
  while queue.any?
      current = queue.pop
      nodes << current.val
      queue.unshift(current.left) if current.left
      queue.unshift(current.right) if current.right
  end
  
  nodes
end

tree = Tree.new
t = gets.strip.to_i
nodes = gets.chomp.split(" ").map(&:to_i)

nodes.each do |node|
  tree.insert node
end

print transverse(tree).join(" ")