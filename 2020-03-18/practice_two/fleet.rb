require 'json'

class Fleet 
    attr_reader :cars

    def initialize()
        @cars = []
    end

    def add(car) 
        cars << car
    end

    def load_from_file(file_name)
        json_data = File.read(file_name)
        ruby_objects = JSON.parse(json_data)
        ruby_objects['cars'].each do |car_obj|
            brand = car_obj['brand']
            model = car_obj['model']
            manifacture_year = car_obj['manifacture_year']
            gasoline_consumption = car_obj['gasoline_consumption']
            car = Auto.new(brand: brand, model: model,  manifacture_year: manifacture_year,gasoline_consumption: gasoline_consumption)
            @cars << car
        end
    end

    def average_consumption()
        if @cars.size == 0
            return 0
        end
        average = @cars.map {|car| car.gasoline_consumption }.reduce(0, :+)/@cars.size
        ("%.2f" % average).to_f
    end

    def number_by_brand(brand_name)
        @cars.count { |car| car.brand.casecmp(brand_name).zero? }
    end

    def consumption_by_brand(brand_name)
        targets_cars = @cars.select {|car| car.brand.casecmp(brand_name).zero? }
        if (targets_cars.size().zero?)
            return 0
        end

        targets_cars.map{ |car| car.gasoline_consumption }. reduce(0, :+) / targets_cars.size()
    end

    def to_s()
        result_str = ""
        @cars.each do |car|
            result_str += car.to_s + "\n"
        end
        result_str
    end
end