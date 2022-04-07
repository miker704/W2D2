class Hangman
  # part 1
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]
  attr_reader :guess_word, :attempted_chars, :remaining_incorrect_guesses
  def self.random_word
    
    return DICTIONARY.sample

  end

  def initialize
    @secret_word=Hangman.random_word
    @guess_word=Array.new(@secret_word.length).fill("_")
    @attempted_chars=[]
    @remaining_incorrect_guesses=5
  end

  def already_attempted?(char)
    return @attempted_chars.include?(char)
  end
  
  def get_matching_indices(char)
    indices=[]
    @secret_word.each_char.with_index{|ch,i| indices<<i if ch==char}
    return indices
  end

  def fill_indices(char,indices)
    indices.each{|idx| @guess_word[idx]=char}
  end
# part 2
  def try_guess(char)
      if self.already_attempted?(char)
        print 'that has already been attempted'
        return false
      end
      @attempted_chars.push(char)
      matching_indices=self.get_matching_indices(char)

      if matching_indices.empty?
          @remaining_incorrect_guesses-=1
        else
          self.fill_indices(char,matching_indices)
      end


   return true

  end

  def ask_user_for_guess
    print 'Enter a char:'
    guess_char=gets.chomp
    return self.try_guess(guess_char)

  end

  def win?
    if @guess_word.join("")==@secret_word
      print 'WIN' 
      return true
    end
      return false
  end

  def lose?
    if @remaining_incorrect_guesses!=0
      return false
    end
    print 'LOSE'
    return true 
  end

  def game_over?
    # return false if self.win? == false || self.lose? == false
    # print @secret_word if self.win? || self.lose?
    # return true
    if self.win? || self.lose?
      print @secret_word
      return true
    end

    return false

  end


end
