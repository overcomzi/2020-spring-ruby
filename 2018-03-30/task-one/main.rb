require 'rubygems'
require 'bundler/setup'

def main
  array = get_num_arr
  solve_with_cycles(array)
  solve_with_iterators(array)
end

def get_num_arr
  arr = []
  loop do
    print "Введите целое число(или введите stop для остановки операции ввода) > "
    input = gets
    break if input == nil
    input.strip!
    break if input.casecmp('stop') == 0
    num = Integer(input, exception: false)
    if num == nil
      puts "Неправильный ввод, попробуйте снова"
      next
    end
    arr << num
    puts "Текущая последовательность: "
    p arr
  end
  arr
end

def sign(num)
  if num >= 0
    :+
  else
    :-
  end
end

def solve_with_cycles(array)
  puts "Решение через циклы========================"
  puts "Исходная последовательность:"
  p array

  cur_sign = sign(array[0])
  change_count = 0
  changed_sign_positions = []

  for idx in 0...array.size
    num = array[idx]
    if cur_sign != sign(num)
      change_count += 1
      changed_sign_positions << idx
    end
    cur_sign = sign(num)
  end

  puts "Кол-во изменений знака в последовательности чисел: #{change_count}"
  puts "Позиции изменений знака:"
  p changed_sign_positions
end

def solve_with_iterators(array)
  puts "Решение через итераторы =============="
  puts "Исходная последовательность:"
  p array

  cur_sign = sign(array[0])
  changed_sign_positions = []

  change_count = array.count { |num| cur_sign != sign(num) }

  array.each_with_index do |num, idx|
    if cur_sign != sign(num)
      changed_sign_positions << idx
    end
    cur_sign = sign(num)
  end

  puts "Кол-во изменений знака в последовательности чисел: #{change_count}"
  puts "Позиции изменений знака:"
  p changed_sign_positions
end

if __FILE__ == $0
  main
end