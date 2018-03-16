class Horse
    @color
    @number
    
    attr_accessor :color, :number
    
    def initialize(color, number)
        @color = color
        @number = number
    end
    
    def color_string()
        case @color
        when 1
            return "R"
        when 2
            return "O"
        when 3
            return "Y"
        when 4
            return "G"
        when 5
            return "B"
        when 6
            return "V"
        end
    end
end

def stable
    input = gets.chomp.split(' ')
    horse_num = input[0].to_i
   
    horses = []
    [*1..6].each do |index|
          horse = Horse.new(index, input[index].to_i)
        horses << horse
    end
   
    horses =  horses.sort_by {|horse| horse.number}.reverse
   
    if horse_num == 1
        return horses[0].color_string()
    end
   
    stable = ""
    while horses[0].number > 0 do
        stable += horses[0].color_string()
        horses[0].number -= 1
        if (horses[1].number) > 0 && !(horses[1].number < horses[2].number)
            stable += horses[1].color_string()
            horses[1].number -= 1
        elsif horses[2].number > 0
            stable += horses[2].color_string()
            horses[2].number -= 1
        else
            return "IMPOSSIBLE"
        end
    end
    
   
    while horses[1].number > 0 do
        if stable[stable.length - 1] == horses[1].color_string()
            if horses[2].number > 0
              stable += horses[2].color_string()
              horses[2].number -= 1
            else
                return "IMPOSSIBLE"
            end
        else
            stable += horses[1].color_string()
            horses[1].number -= 1
        end
    end
   
    while horses[2].number > 0 do
        if stable[stable.length - 1] == horses[2].color_string()
            return "IMPOSSIBLE"
        else
            stable += horses[2].color_string()
            horses[2].number -= 1
        end
    end
   
    return stable
end


def main
    tests = gets.chomp.to_i
    [*1..tests].each do |case_num|
        puts "Case ##{case_num}: #{stable}"
    end
end

main