def steed
    input = gets.chomp.split(' ')
    destination = input[0].to_i
    horse_num = input[1].to_i
    
    horses = []
    longest_trip = 0
    [*0...horse_num].each do |index|
        input = gets.chomp.split(' ')
        horses[index] = [input[0].to_i, input[1].to_i]
        travel_distance = destination - horses[index][0]
        travel_time = travel_distance.to_f / horses[index][1].to_f
        horses[index] << travel_time
        if travel_time > longest_trip
            longest_trip = travel_time
        end
    end
    
    mySpeed = destination.to_f / longest_trip.to_f
    
    return mySpeed
end


def main
    tests = gets.chomp.to_i
    [*1..tests].each do |case_num|
        puts "Case ##{case_num}: #{'%.06f' % steed}"
    end
end

main
