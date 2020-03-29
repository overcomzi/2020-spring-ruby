require_relative "my_complex.rb"

def main
    compl1 = MyComplex.new(5,4)
    compl2 = MyComplex.new(1, 0)
    compl3 = MyComplex.new(0, 1)

    puts "Сумма #{compl1} и #{compl2} равна #{compl1.add(compl2)}"
    puts "Разность #{compl2} и #{compl1} равна #{compl2.sub(compl1)}"
    puts "Произведение #{compl1} и #{compl2} равна #{compl1.multiplay(compl2)}"
    puts "Деление #{compl1} и #{compl2} равна #{compl1.divide(compl2)}"
end

if __FILE__ == $0 
    main
end