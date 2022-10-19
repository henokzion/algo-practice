#!/bin/ruby

require 'json'
require 'stringio'

#
# Complete the 'runningMedian' function below.
#
# The function is expected to return a DOUBLE_ARRAY.
# The function accepts INTEGER_ARRAY a as parameter.
#

class Heap
    attr_accessor :arr 
    def initialize
        @arr = []
    end
    
    def insert val
        return @arr << val unless @arr.any?
        @arr << val
        index = @arr.length - 1
        parent_index = (index - 1)/2
        while @arr[parent_index] < @arr[index] || parent_index != 0
            p  @arr[parent_index], @arr[index] 
            @arr[parent_index], @arr[index] = @arr[index], @arr[parent_index] 
            index = parent_index
            parent_index = (parent_index -1 )/ 2
        end
    end
end

def median(arr)
    len = arr.length
    if len.odd?
        arr[len/2].to_f
    else
        (arr[(len/2)] + arr[(len/2)- 1])/2.0
    end
end

def runningMedian(a)
    # Write your code here
    heap = Heap.new
    medians = []
    a.each do |member|
        heap.insert member
        medians << median(heap.arr)
    end
    
    medians
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

a_count = gets.strip.to_i

a = Array.new(a_count)

a_count.times do |i|
    a_item = gets.strip.to_i
    a[i] = a_item
end

result = runningMedian a

fptr.write result.join "\n"
fptr.write "\n"

fptr.close()
