# Eloquent Ruby -- Digging in to Arrays and Strings
# https://github.com/turingschool/challenges/blob/master/eloquent_ruby_arrays_and_strings.markdown

# PART 1: SMART COLLECTIONS
  # 1. Using Variable Method Arguments
    # Write a method that takes any number of arguments, and prints the value of the first and last arguments, ignoring any middle ones.
      def any_args(first_arg, *mid_args, last_arg)
        puts "First Argument: #{first_arg}, Last Argument: #{last_arg}"
      end

      any_args("first", "second", "third")

  # 2. Using Map and Join
    # Create an array containing the strings "dog", "cat", "goat", and "capybara"
      arr = %w(dog cat goat capybara)

    # Transform this array into a new array where each string is capitalized ("Dog", "Cat", "Goat", "Capybara")
      new_arr = arr.map do |word|
        word.capitalize!
      end

    # Combine this collection of capitalized strings into a single string, with each element separated by a comma and a space ("Dog, Cat, Goat, Capybara")
      new_arr.join(",")

  # 3. Dangers of ! Methods
      # Summarize in your own words the conventions around methods whose names end in a !
        # Methods contaning a ! permanently change the original input, or "modify the caller", and are considered "destructive" methods.

      # Describe in your own words the advantages and disadvantages of these methods. When would you want to use one and when would you want to avoid using one.
        # For comparison purposes it may be best to temporarily change the input - for example, to see if a word is capitalized, but you dont necessary want to permanently change what data was given. In other cases you want the data to be permanently changed - if you are adding an entry to an array of names with .push, for example, or if you want to be continuing to use the modified data without creating a new object.

# PART 2: SMART STRINGS

  # 1. Special Characters in Strings
    # What does it mean to "escape" a character within a string?
      # It interprets the character literally as the ascii character you'd like printed to the screen, rather than the functional characters used to write ruby code.
    # List 3 characters that have to be "escaped" when written in a string.
      # backslash, new line, tab, double quotes within a double quoted string, single quotes within a single quoted string,
    # Use escape strings to generate a string containing your name and, on a separate line, your height in inches and feet.
      str = "Brenna\n5'6"
      puts str

  # 2. Splitting Strings
    # Take the string of your name and height you generated in the previous section and split it into an array containing your name (as the first element) and height (as the second element).
      str.split(' ')

  # 3. Poking at Bytes
    # We know that ultimately all data on our computers has to get represented as numbers (numbers encoded as 1's and 0's, to be precise). So how does text fit into this representation?

    # In short, the machine uses tables that map characters to specific numeric values.

    # Use the each_byte method on a string to discover which numeric byte values correlate to each character in your name.
      "Brenna".each_byte { |letter| puts letter }
