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
  return @passengers.length()
end

def pick_up_passenger(person)
  @passengers.push(person)
end

def drop_off(person)
  index = @passengers.index(person)
  @passengers.slice!(index, 1)# it cancel 1 element at the index of the person(if person is at index 2, it will cancel index 2)
end

def empty_bus()
  @passengers.clear
end

def pick_up_from_bus_stop(stop)
  for person in stop.queue()#given the stop quere the queue is, push each person into the bus, and then empty the queue at the bus stop
    pick_up_passenger(person)
  end
  stop.empty_queue()
end 

end
