arr = [0, 1, 5, 7]
# two_sum?(arr, 6) # => should be true
# two_sum?(arr, 10) # => should be false

# Phase I

def bad_two_sum?(arr, target_sum) # => n^2
    (0...arr.length).each do |i|
        (i+1...arr.length).each do |j|
            return true if arr[i] + arr[j] == target_sum
        end
    end
    false
end

# Phase II

def okay_two_sum?(arr, target_sum) # => n log n
    arr.sort!
    arr.each_with_index do |ele, i|
        return true if bsearch(arr, target_sum - ele, i)
    end
    false
end

def bsearch(arr, target, i)
    return false if arr.empty?
    mid = arr.length / 2
    return true if arr[mid] == target && mid != i
    if arr[mid] > target
        bsearch(arr[0...mid], target, i)
    else
        bsearch(arr[mid+1..-1], target, i)
    end
end

# Phase III

def two_sum?(arr, target_sum)
    hash = Hash.new(0)
    arr.each do |ele|
      complement = target_sum - ele
      return true if hash.key?(complement)
      hash[ele] = 1
    end
    false
  end
  

p two_sum?(arr, 6) # => should be true
p two_sum?(arr, 10) # => should be false
p okay_two_sum?(arr, 6) # => should be true
p okay_two_sum?(arr, 10) # => should be false
p two_sum?(arr, 6) # => should be true
p two_sum?(arr, 10) # => should be false