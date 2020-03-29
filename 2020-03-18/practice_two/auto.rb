class Auto 
    attr_reader :brand, :model, :manifacture_year, :gasoline_consumption

    def initialize(brand:, model:, manifacture_year:, gasoline_consumption:)
        @brand = brand
        @model = model
        @manifacture_year = manifacture_year
        @gasoline_consumption = gasoline_consumption
    end

    def to_s() 
        "Марка: #{@brand},
Модель: #{@model},
Год выпуска: #{manifacture_year},
Средний расход бензина: #{gasoline_consumption}
        "
    end
end