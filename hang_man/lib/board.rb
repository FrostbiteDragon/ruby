class Board
  attr_reader :word
  attr_reader :letters
  attr_reader :guesses
  GUESS_LIMIT = 6

  def initialize
    @word = "flubber"
    @letters = []
    @guesses = 0
  end

  #output:
  # 0 = continue
  #-1 = lost
  # 1 = win
  def update(letter)


    #validate input
    if letter.length > 1 || !(letter =~ /[[:alpha:]]/) || @letters.include?(letter)
      return 0 
    end 

    @letters << letter
    @letters.sort!

    unless @word.include?(letter); @guesses += 1 end

    #return state
    if @guesses >= GUESS_LIMIT; -1
    elsif @word.chars.all?{|char| @letters.include?(char)}; 1
    else; 0 end
  end

  def display
    message = ''

    @word.chars.each { |char|
      if (@letters.include?(char))
        message << char
      else
        message << '_'
      end

      message << ' '
    }

    puts message
    puts ''

    puts "Guesses left #{GUESS_LIMIT - @guesses}"
    print "Guessed letters: "
    @letters.each { |char| print "#{char} " }
    puts ""
  end
end