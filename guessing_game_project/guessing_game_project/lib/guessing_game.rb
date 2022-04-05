class GuessingGame

    def initialize(min,max)
        @secret_num= rand(min..max)
        @num_attempts=0
        @game_over=false

    end
    
    def num_attempts
        return @num_attempts
    end
    
    def game_over?
        return @game_over
    end

    def check_num(num)
        @num_attempts+=1
       
       if @secret_num==num
           @game_over=true
           print 'you win'
       elsif @secret_num<num 
           print 'too big'
       elsif @secret_num>num
           print 'too small'
       end

    end

    def ask_user()
        print 'enter a number'
        input_num=gets.chomp.to_i
        self.check_num(input_num)
    end


end
