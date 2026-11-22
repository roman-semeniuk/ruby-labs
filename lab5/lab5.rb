module GPSLocatable
  def set_coordinates(latitude, longitude)
    @latitude = latitude
    @longitude = longitude
  end

  def current_location
    "#{@latitude}, #{@longitude}"
  end
end

module FleetAuditor
  def fleet_category
    "Park Rental Fleet"
  end
end

class FleetCounter
  attr_reader :count

  def initialize
    @count = 0
  end

  def increment
    @count += 1
  end
end

class ParkTransport
  include GPSLocatable
  extend FleetAuditor

  class << self
    attr_accessor :counter
  end
  self.counter = FleetCounter.new

  def self.new(*args, &block)
    vehicle = super
    ParkTransport.counter.increment
    vehicle
  end

  attr_reader :id, :title, :total_hours
  attr_accessor :condition

  def initialize(id, title, hourly_rate)
    @id = id
    @title = title
    self.hourly_rate = hourly_rate
    @rented = false
    @total_hours = 0
    @condition = "Good"
  end

  def hourly_rate
    @hourly_rate
  end

  def hourly_rate=(rate)
    @hourly_rate = rate > 0 ? rate : 10
  end

  def rented?
    @rented
  end

  def available?
    !@rented
  end

  def rent(hours)
    return "Transport #{@title} is already rented" if rented?
    return "Invalid rental duration" unless valid_duration?(hours)

    @rented = true
    @total_hours += hours
    calculate_rental_cost(hours)
  end

  def return_transport
    return "Transport #{@title} was not rented" unless rented?

    @rented = false
    "Transport #{@title} successfully returned"
  end

  def calculate_rental_cost(hours)
    @hourly_rate * hours
  end

  def compare_usage(other)
    if internal_total_hours > other.internal_total_hours
      "#{@title} has been used more than #{other.title}"
    elsif internal_total_hours < other.internal_total_hours
      "#{other.title} has been used more than #{@title}"
    else
      "#{@title} and #{other.title} have equal usage"
    end
  end

  protected

  def internal_total_hours
    @total_hours
  end

  private

  def valid_duration?(hours)
    hours.is_a?(Numeric) && hours > 0
  end
end

class ParkTrain < ParkTransport
  attr_reader :wagons_count

  def initialize(id, title, hourly_rate, wagons_count)
    super(id, title, hourly_rate)
    @wagons_count = wagons_count
  end

  def calculate_rental_cost(hours)
    base_cost = super(hours)
    base_cost + (@wagons_count * 15 * hours)
  end
end

class Bicycle < ParkTransport
  attr_reader :has_child_seat

  def initialize(id, title, hourly_rate, has_child_seat)
    super(id, title, hourly_rate)
    @has_child_seat = has_child_seat
  end

  def calculate_rental_cost(hours)
    base_cost = super(hours)
    hours > 3 ? (base_cost * 0.8).round(2) : base_cost
  end
end

class ElectricScooter < ParkTransport
  attr_reader :battery_level

  def initialize(id, title, hourly_rate, battery_level = 100)
    super(id, title, hourly_rate)
    @battery_level = battery_level
  end

  def rent(hours)
    return "Transport #{@title} is already rented" if rented?
    return "Cannot rent scooter: insufficient battery" unless sufficient_battery?

    cost = super(hours)
    consume_battery(hours)
    cost
  end

  def calculate_rental_cost(hours)
    unlock_fee = 10
    unlock_fee + super(hours)
  end

  def charge
    @battery_level = 100
    "Scooter #{@title} fully charged"
  end

  private

  def sufficient_battery?
    @battery_level >= 20
  end

  def consume_battery(hours)
    @battery_level = [@battery_level - (hours * 15), 0].max
  end
end

puts "=== Demonstration of Park Transport Rental System ==="
puts

puts "1. Fleet category (extended module method): #{ParkTransport.fleet_category}"

train = ParkTrain.new(1, "Park Express", 120, 4)
bike = Bicycle.new(2, "City Cruiser", 40, true)
scooter = ElectricScooter.new(3, "Xiaomi Pro", 50, 85)

puts "Total transports created (tracked via redefined self.new): #{ParkTransport.counter.count}"
puts

puts "2. Modules and Mixins (GPSLocatable included):"
train.set_coordinates(50.4501, 30.5234)
bike.set_coordinates(50.4515, 30.5260)
scooter.set_coordinates(50.4520, 30.5280)
puts "#{train.title} coordinates: #{train.current_location}"
puts "#{bike.title} coordinates: #{bike.current_location}"
puts "#{scooter.title} coordinates: #{scooter.current_location}"
puts

puts "3. Getters, Setters, and Encapsulation:"
puts "#{bike.title} initial rate: #{bike.hourly_rate}"
bike.hourly_rate = 45
puts "#{bike.title} updated rate: #{bike.hourly_rate}"
bike.hourly_rate = -10
puts "#{bike.title} validated rate after negative value: #{bike.hourly_rate}"
puts

puts "4. Polymorphic Rental Cost Calculation and Overriding with super:"
puts "Rental cost for #{train.title} (2 hours, 4 wagons): #{train.calculate_rental_cost(2)} UAH"
puts "Rental cost for #{bike.title} (2 hours): #{bike.calculate_rental_cost(2)} UAH"
puts "Rental cost for #{bike.title} (4 hours with discount): #{bike.calculate_rental_cost(4)} UAH"
puts "Rental cost for #{scooter.title} (2 hours with unlock fee): #{scooter.calculate_rental_cost(2)} UAH"
puts

puts "5. Renting and Returning Process:"
puts "Renting #{scooter.title} for 2 hours:"
cost = scooter.rent(2)
puts "Cost: #{cost} UAH, Remaining battery: #{scooter.battery_level}%"
puts "Available? #{scooter.available?}"
puts "Attempting to rent again: #{scooter.rent(1)}"
puts scooter.return_transport
puts "Available? #{scooter.available?}"
puts

puts "6. Protected Method (comparing usage between objects):"
train.rent(3)
puts train.compare_usage(scooter)
puts

puts "7. Singleton Method on a Specific Object:"
def train.special_festive_route
  "Train #{title} is on a special Christmas route with music and treats!"
end

puts train.special_festive_route
puts "Does bike have special_festive_route? #{bike.respond_to?(:special_festive_route)}"