require_relative 'extentions'

class Board
  attr_reader :word
  attr_reader :letters
  attr_reader :guesses
  GUESS_LIMIT = 6

  def initialize(letters = [], guesses = 0, word = nil)
    @letters = letters
    @guesses = guesses

    if !word.nil?
      @word = word
    else
      lines = File.readlines('words.txt')
      @word = lines[rand(lines.length - 1)].chomp
    end

  end

  #output:
  # 0 = continue
  #-1 = lost
  # 1 = win
  def update(letter)
    #validate input
    if letter.length > 1 || !(letter =~ /[[:alpha:]]/) || @letters.include?(letter); return 0 end

    @letters << letter
    @letters.sort!

    unless @word.include?(letter); @guesses += 1 end

    #return state
    if @guesses >= GUESS_LIMIT; -1
    elsif @word.chars.all?{|char| @letters.include?(char)}; 1
    else; 0 end
  end

  def display
    puts Extentions.format_word(@word, @letters)
    puts ''

    puts "Guesses left #{GUESS_LIMIT - @guesses}"
    print "Guessed letters: "
    @letters.each { |char| print "#{char} " }
    puts ""
  end
end