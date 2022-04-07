require_relative "room"

class Hotel

  attr_reader :rooms

    def initialize(name,room_hash)
        @name=name
        @rooms={}
        room_hash.each{|k,v| @rooms[k]=Room.new(v)}
    end

    def name
         return @name.split(" ").map(&:capitalize).join(" ")        
    end

    def room_exists?(name)
        return @rooms.key?(name)
    end


    def check_in(person,room_name)
        if !self.room_exists?(room_name)
            print 'sorry, room does not exist'
            return
        else self.room_exists?(room_name)
            successful=@rooms[room_name].add_occupant(person)
            if successful
                print 'check in successful'
            else
                print 'sorry, room is full'
            end
            
        end


    end

    def has_vacancy?
        return @rooms.values.any?{|hotelrm| !hotelrm.full? }
    end

    def list_rooms
        @rooms.each do |name,room|
            puts "#{name} : #{room.available_space}"
        end
    end



end
