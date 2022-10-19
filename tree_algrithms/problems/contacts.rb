#!/bin/ruby

require 'json'
require 'stringio'

#
# Complete the 'contacts' function below.
#
# The function is expected to return an INTEGER_ARRAY.
# The function accepts 2D_STRING_ARRAY queries as parameter.
#

class Node
    attr_accessor :count, :children
    def initialize
        @count = 0
        @children = {}
    end
end

class Tree
    def initialize
        @root = Node.new
    end
    
    def insert word
        current =  @root
        word.split("").each do |char|
            if current.children[char].nil?
                current.children[char] = Node.new
            end
            
            current.children[char].count +=1
            current = current.children[char]
        end
    end
    
    def search partial
        current = @root
        partial.split("").each do |char|
            return 0 unless current.children[char]
            current = current.children[char] 
        end
        
        current.count
    end
end

def contacts(queries)
    tree = Tree.new
    result = [] 
    queries.each do |action, str|
        case action
        when 'add'
            tree.insert str
        when 'find'
            result << tree.search(str)
        end
    end
    result 
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

queries_rows = gets.strip.to_i

queries = Array.new(queries_rows)

queries_rows.times do |i|
    queries[i] = gets.rstrip.split
end

result = contacts queries

fptr.write result.join "\n"
fptr.write "\n"

fptr.close()
