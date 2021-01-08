# The function `lower_case` takes an array of strings and converts
# any non-lower case alphabet (A..Z) to corresponding lower case
# alphabet
def lower_case(words)
  return words.map{|word| word.downcase}
end

# Similar to `lower_case`, this function modifies the array in-place
# and does not return any value.
def lower_case!(words)
  return words.map!(&:downcase) # ! is bang operator
end

# Given a prefix and an array of words, return an array containing
# words that have same prefix.
#
# For example:
# words_with_prefix('apple', ['apple', 'ball', 'applesauce']) would
# return the words 'apple' and 'applesauce'.
def words_with_prefix(prefix, words)
  return  words.filter_map{|word| word if word.index(prefix)==0}
  #using only map causes some unnecessary trouble of nil in the result array
end

# The similarity score between two words is defined as the length of
# largest common prefix between the words.
#
# For example:
# - Similarity of (bike, bite) is 2 as 'bi' is the largest common prefix.
# - Similarity of (apple, bite) is 0 as there are no common letters in
#   the prefix
# - similarity of (applesauce, apple) is 5 as 'apple' is the largest
#   common prefix.
# 
# The function `similarity_score` takes two words and returns the
# similarity score (an integer).
def similarity_score(word_1, word_2)
    shortest= [word_1.length, word_2.length].min
    count=0
    (0..shortest-1).each do |i|
      if word_1[i]==word_2[i]
        count+=1
      else
        break
      end
    end
  return count
end

# Given a chosen word and an array of words, return an array of word(s)
# with the maximum similarity score in the order they appear.
def most_similar_words(chosen_word, words)
    result=words.map{|word| similarity_score(chosen_word,word)}
    return (0..words.length()-1).filter_map{|i| words[i] if result[i]==result.max}      
end
