##Thuesday, January, 28, 2021
##aAcademy >  Execution Time Differences/Algorithms
##Luciano A. Campos

def bad_two_sum?(arr, target_sum)
    arr.length.times do |i|
        (arr.length - i - 1).times do |j|
            return true if arr[i] + arr[j + i + 1] == target_sum
        end
    end
  false
end

def okay_two_sum_a?(arr, target_sum)
    arr = arr.sort
    i, j = 0, arr.length - 1

    while i < j
        case (arr[i] + arr[j]) <=> target_sum
        when 0
            return true
        when -1
            i += 1
        when 1
            j -= 1
        end
    end
  false
end

def okay_two_sum_b?(arr, target_sum)
    arr = arr.sort
    arr.each_with_index do |el, i|
        match_idx = arr.bsearch_index { |el2| (target_sum - el) <=> el2 }
        return true if match_idx && match_idx != i
    end
  false
end

def two_sum?(arr, target_sum)
    complements = {}

    arr.each do |el|
        return true if complements[target_sum - el]
        complements[el] = true
    end

  false
end

def two_sum_indices(arr, target_sum)
    complements = {}
    arr.each_with_index do |el, i|
        complement, j = complements[target_sum - el]
    return [i, j] if complement

        complements[el] = [el, i]
    end
  nil
end

def four_sum?(array, target)
    hash = Hash.new
    two_sum_hash = Hash.new
    three_sum_hash = Hash.new

    array.each do |num|

        return true if three_sum_hash[target - num]

        two_sum_hash.each_key do |key|
            three_sum_hash[key + num] = true
        end

        hash.each_key do |key|
            two_sum_hash[key + num] = true
        end

        hash[num] = true
    end

  false
end
