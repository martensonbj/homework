#https://github.com/turingschool/challenges/blob/master/collections.markdown

#1. Age Ordering

data = [
  ['Frank', 33],  # => ["Frank", 33]
  ['Stacy', 15],  # => ["Stacy", 15]
  ['Juan', 24],   # => ["Juan", 24]
  ['Dom', 32],    # => ["Dom", 32]
  ['Steve', 24],  # => ["Steve", 24]
  ['Jill', 24]    # => ["Jill", 24]
]                 # => [["Frank", 33], ["Stacy", 15], ["Juan", 24], ["Dom", 32], ["Steve", 24], ["Jill", 24]]

# Level 1: Write code that'll output the names (and only the names) in order by ascending age

  sorted_data = data.sort_by {|x| x[1]}     # => [["Stacy", 15], ["Juan", 24], ["Jill", 24], ["Steve", 24], ["Dom", 32], ["Frank", 33]]
  #SORT OPTION 2: sorted_data_2 = data.sort {|a,b| a[1] <=> b[1]}
  sorted_data.each {|x| puts "#{x.first}"}
  # => [["Stacy", 15],
  #     ["Juan", 24],
  #     ["Jill", 24],
  #     ["Steve", 24],
  #     ["Dom", 32],
  #     ["Frank", 33]]

  #Turn sorted array into hash
  data_hash = Hash[sorted_data.map {|key, value| [key, value]}]  # => {"Stacy"=>15, "Juan"=>24, "Jill"=>24, "Steve"=>24, "Dom"=>32, "Frank"=>33}

# Level 2: Output the name with the age, like Juan (24)

  sorted_data.each {|x| puts "#{x.first} (#{x.last})"}  # => [["Stacy", 15], ["Juan", 24], ["Jill", 24], ["Steve", 24], ["Dom", 32], ["Frank", 33]]

# Level 3: If there are multiple people tied with the same age, put them in alphabetical order

  age_then_name = data.sort_by {|x| [x[1], x[0]]}         # => [["Stacy", 15], ["Jill", 24], ["Juan", 24], ["Steve", 24], ["Dom", 32], ["Frank", 33]]
  age_then_name.each {|x| puts "#{x.first} (#{x.last})"}  # => [["Stacy", 15], ["Jill", 24], ["Juan", 24], ["Steve", 24], ["Dom", 32], ["Frank", 33]]

# Level 4: Write code to automatically build a hash with the age as the key and an array of names as the value (all the people who are that age). e.g. {24 => ['Juan', 'Steve', 'Jill']...}


  #TO CREATE A HASH FROM ARRAY
  # data_hash = Hash[data.map {|key, value| [key, value]}]

  #ATTEMPTS TO REORDER HASH WITH AGE FIRST:
    # OPTION 1
    # data_hash = Hash[data.map {|key, value| [key, value]}]
    # data_hash.invert
    # OPTION 2
    # data_hash_inverse = Hash[data.map {|value, key| [key, value]}]

# GOAL OF QUESTION
  # iterate through array
  # look at element[1] of first element
  # if element[1] is in hash, push element[0] into value.
  # else create new key for element[1]

result = {}  # => {}

age_then_name.each do |name, age|  # => [["Stacy", 15], ["Jill", 24], ["Juan", 24], ["Steve", 24], ["Dom", 32], ["Frank", 33]]
  if result.has_key?(age)          # => false, false, true, true, false, false
    result[age] << name            # => ["Jill", "Juan"], ["Jill", "Juan", "Steve"]
  else
    result[age] = [name]           # => ["Stacy"], ["Jill"], ["Dom"], ["Frank"]
  end                              # => ["Stacy"], ["Jill"], ["Jill", "Juan"], ["Jill", "Juan", "Steve"], ["Dom"], ["Frank"]
end                                # => [["Stacy", 15], ["Jill", 24], ["Juan", 24], ["Steve", 24], ["Dom", 32], ["Frank", 33]]

puts result  # => nil

# >> Stacy
# >> Juan
# >> Jill
# >> Steve
# >> Dom
# >> Frank
# >> Stacy (15)
# >> Juan (24)
# >> Jill (24)
# >> Steve (24)
# >> Dom (32)
# >> Frank (33)
# >> Stacy (15)
# >> Jill (24)
# >> Juan (24)
# >> Steve (24)
# >> Dom (32)
# >> Frank (33)
# >> {15=>["Stacy"], 24=>["Jill", "Juan", "Steve"], 32=>["Dom"], 33=>["Frank"]}
