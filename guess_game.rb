#Output welcome message
def welcome_message
  puts "You're welcome. Guess number from 1 to #{max_number}: "
end

#Max number as a first console argument. 1000 by default if there's no argument while running the program
def max_number
  ARGV[0].nil? ? 1000 : ARGV[0].to_i 
end

#Random number
def generate_target_number
  rand(1..max_number)
end

#User input
def guessed_number
  STDIN.gets.chomp('').to_i
end

#Check user input
def check_condition(guessed_number, target_number)
  if guessed_number < target_number
    puts 'Number is less than user_input'
  elsif guessed_number > target_number
    puts 'Number is greater than user_input'
  else
    'Winner'
  end
end

#Output lost message
def show_lost_message(attempts_amount, target_number)
  puts "You lost. Number was #{target_number}." if attempts_amount == 0
end

#Output winner message
def show_winner_message
  puts 'You won!'
end

#If max number is <= 10 then decrease amount of attempts for more interesting game :)
def set_attempts_amount
  max_number <= 10 ? 2 : 10
end


def start_game
  target_number = generate_target_number
  attempts_amount = set_attempts_amount

  
  while attempts_amount > 0 do
    p "#{attempts_amount} attempts left" if attempts_amount != 10 && attempts_amount != 2

    if check_condition(guessed_number, target_number) == 'Winner'
      show_winner_message
      break
    end

    #Decrease amount of attempts
    attempts_amount -= 1
  end

  show_lost_message(attempts_amount, target_number)
end

welcome_message
start_game
