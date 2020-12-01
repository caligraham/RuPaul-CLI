class Cli

    def start
        puts "Welcome racers, start your engines please! Press any key to continue."
        puts "Vroom vroom, loading herstorical Queens...."
        Api.load_data
        main_menu_options
    end

    def main_menu_options
        puts "Type werk, to see a list of Queens!"
        puts "Type bye, to make a dramatic exit"
        main_menu
    end

    def main_menu
        input = get_input

        if input == "werk"
            puts "Getting your Queens..."
            list_queens
        elsif input == "bye"
            puts "Don't let the door hit you on the way out!!"
            exit
        else
            invalid_choice
            main_menu_options
        end

    end

    def invalid_choice
        puts "WRONG, try again trick!"
    end

    def get_input
        gets.chomp
    end

    def list_queens
        Queens.all.each.with_index(1) do |queen, index|
            puts "#{index}. #{queen.name}"
        end

        queens_details_menu_options
    end

    def queens_details_menu_options 
        puts "Choose your Queen, darling! Enter the number you wish to see."
        puts "Or type 'bye' to get out of here!"
        queens_details_menu
    end


    def queens_details_menu
        input = get_input

        if input.to_i.between?(1, Queens.all.length)

            index = input.to_i - 1
            queen = Queens.all[index]
            print_queens_details(queen)
            select_again_or_exit
        elsif input == "bye"
            puts "BYE FELICIA"
            exit
        else
            invalid_choice
            queens_details_menu
        end
    end

    def print_queens_details(queen)
        puts "********************"
        puts "Queen Name: #{queen.name}"
        puts "Were they a winner? #{queen.winner}"
        puts "Famous for saying... #{queen.quote}"
        puts "********************"
    end

    def select_again_or_exit
        puts "Well, would you like to see more Glam Gals?"
        puts "'werk' for main menu"
        puts "'bye' to get the hell outta here!"
        input = get_input

        if input == "werk"
            queens_details_menu_options
            list_queens
        elsif input == "bye"
            puts "See you around, gorgeous!"
            exit
        else
            invalid_choice
            select_again_or_exit
        end
    end



end
