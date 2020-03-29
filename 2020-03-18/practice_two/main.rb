require_relative "auto.rb"
require_relative "fleet.rb"

def main
    auto1 = Auto.new(brand: "Honda", model: "Civic", manifacture_year: 1998, gasoline_consumption: 12.5)
    auto1 = Auto.new(brand: "Audi", model: "R8 RWS", manifacture_year: 2018 , gasoline_consumption: 10)

    fleet = Fleet.new()
    fleet.load_from_file("cars_info.json")
    puts fleet
    puts "Среднее потребление всех марок машин: #{fleet.average_consumption}"
    puts "Число Audi #{fleet.number_by_brand("Audi")}"
    puts "Среднее потребление по марке Audi #{fleet.consumption_by_brand("Audi")}"
end

if __FILE__ == $0
    main
end