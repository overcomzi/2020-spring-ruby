class MyComplex
    attr_reader :real, :imaginary
    def initialize(real = 0, imaginary = 0)
        @real = real
        @imaginary = imaginary
    end

    def add(other) 
        MyComplex.new(@real + other.real, @imaginary + other.imaginary)
    end

    def sub(other)
        MyComplex.new(@real - other.real, @imaginary - other.imaginary)
    end

    def multiplay(other)
        new_real = @real * other.real - imaginary * other.imaginary
        new_imaginary = @real * other.imaginary + other.real * @imaginary
        MyComplex.new(new_real, new_imaginary)
    end

    def divide(other)
        new_real = @real * other.real + @imaginary * other.imaginary
        new_real /= other.real ** 2 + other.imaginary ** 2
        new_imaginary = @imaginary * other.real - @real * other.imaginary
        new_imaginary /= other.real ** 2 + other.imaginary ** 2
        MyComplex.new(new_real, new_imaginary)
    end

    def conjugate()
        MyComplex.new(@real, -@imaginary)
    end

    def to_s() 
        if @imaginary > 0
            "#{@real} + i#{@imaginary}"
        elsif @imaginary == 0
            "#{@real}"
        else
            "#{@real} - i#{imaginary.abs}"
        end
    end
end