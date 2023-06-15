# anagram?("gizmo", "sally")    #=> false
# anagram?("elvis", "lives")    #=> true

# Phase I:


def first_anagram?(str1, str2) # => n!
    anagrams = str1.split("").permutation.to_a
    anagrams.map! {|sub| sub.join("")}
    anagrams.include?(str2)
end

# Phase II:

def second_anagram?(str1, str2) # => n^2
    str1.each_char do |char|
        idx = str2.index(char)
        return false if idx.nil?
        str2[idx] = ""
    end
    str2.empty?
end

# Phase III: 

def third_anagram?(str1, str2) # => n log n
    str1.split("").sort == str2.split("").sort
end

# Phase IIII:

def fourth_anagram?(str1, str2) # => n
    hash1 = Hash.new(0)
    hash2 = Hash.new(0)
    str1.each_char {|char| hash1[char] += 1}
    str2.each_char {|char| hash2[char] += 1}
    hash1 == hash2
end

p first_anagram?("gizmo", "sally")    #=> false
p second_anagram?("gizmo", "sally")    #=> false
p third_anagram?("gizmo", "sally")    #=> false
p fourth_anagram?("gizmo", "sally")    #=> false
p fourth_anagram?("elvis", "lives")    #=> true
p first_anagram?("elvis", "lives")    #=> true
p second_anagram?("elvis", "lives")    #=> true
p third_anagram?("elvis", "lives")    #=> true
