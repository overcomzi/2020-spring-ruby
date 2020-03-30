# frozen_string_literal: true

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
    print "enter an integer (or enter 'stop' to stop the input operation > "
    input = gets
    break if input.nil?

    input.strip!
    break if input.casecmp('stop') == 0

    num = Integer(input, exception: false)
    if num.nil?
      puts 'Invalid input, try again.'
      next
    end
    arr << num
    puts 'Your sequence: '
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
  puts '=' * 5 + 'Cycle Solytion' + '=' * 5
  puts 'Your sequence: '
  p array

  cur_sign = sign(array[0])
  change_count = 0
  changed_sign_positions = []

  for idx in (0...array.size) do
    num = array[idx]
    if cur_sign != sign(num)
      change_count += 1
      changed_sign_positions << idx
    end
    cur_sign = sign(num)
  end

  puts "Number of sign changes in a sequence of numbers: #{change_count}"
  puts 'Sign Change Positions:'
  p changed_sign_positions
end

def solve_with_iterators(array)
  puts '=' * 5 + 'Iterators Solytion' + '=' * 5
  puts 'Your sequence: '
  p array

  cur_sign = sign(array[0])
  changed_sign_positions = []

  change_count = array.count { |num| cur_sign != sign(num) }

  array.each_with_index do |num, idx|
    changed_sign_positions << idx if cur_sign != sign(num)
    cur_sign = sign(num)
  end

  puts "Number of sign changes in a sequence of numbers: #{change_count}"
  puts 'Sign Change Positions:'
  p changed_sign_positions
end

main if __FILE__ == $PROGRAM_NAME
