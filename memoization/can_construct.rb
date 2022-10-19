def can_construct word, list, memo={}
  return true if word == ""
  return memo[word] if memo.key? word

  list.each do |sub_string|
    if word.start_with?(sub_string) && can_construct(word.delete_prefix(sub_string), list, memo)
      memo[word] = true
      return true
    end
  end
  
  memo[word] = false
  false
end

p can_construct("eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeef", ["e", "ee", "eee", "eeee", "eeeee", "eeeeee"])