list = [5, 3, -7]

# possible sub-sums
[5]           # => 5
[5, 3]        # => 8 --> we want this one
[5, 3, -7]    # => 1
[3]           # => 3
[3, -7]       # => -4
[-7]          # => -7

# Phase I

# def largest_contiguous_subsum(list) # => 8
#     sub_arrays = []
#     (0...list.length).each do |i|
#         (i...list.length).each do |j|
#             sub_arrays << list[i..j]
#         end
#     end
#     sub_arrays.map! {|sub| sub.sum}
#     sub_arrays.max
# end

# Phase II

def largest_contiguous_subsum(list) # => 8
    largest_sum = list.first
    current_sum = list.first
    (1...list.length).each do |i|
        current_sum = 0 if current_sum < 0
        current_sum += list[i]
        largest_sum = current_sum if current_sum > largest_sum
    end
    largest_sum
end

p largest_contiguous_subsum(list) # => 8