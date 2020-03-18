class Bus

  attr_reader :route_num, :destination, :passengers

def initialize(route_num, destination)
  @route_num = route_num
  @destination = destination
  @passengers = []
end

def drive_noise()
  return "Brum brum"
end

def check_how_many_passengers()
  return @passengers.length
end

def pick_up_passenger(person)
  @passengers.push(person)
end

def drop_off()
  passenger = @passengers.pop()
  return passenger
end

def empty_bus()
  @passengers = []
end


end
