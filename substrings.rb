def substrings(string, dictionary)
  matches = Hash.new(0)

  for item in dictionary do
    if string.downcase.include? item
        matches[item] = string.downcase.scan(item).count
    end
  end
  matches
end

dictionary = ["below", "down", "go", "going", "horn", "how", "howdy", "it", "i", "low", "own", "part", "partner", "sit"]
puts substrings("Howdy partner, sit down! How's it going?", dictionary)