class Cli

    # start of program. welcome message & Api is loaded & calls the load_data method
    def start
        puts "Welcome racers, start your engines please!"
        puts "Vroom vroom, loading herstorical Queens...."
        puts " "
        Api.load_data
        main_menu_options
    end

    # displays option menu to user & gives instructions
    def main_menu_options
        puts "Type werk, to see a list of Queens!"
        puts "Type bye, to make a dramatic exit"
        main_menu
    end

    # takes user input and uses control flow to determine next step
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

    # displays an error message to user when input does not match options
    def invalid_choice
        puts "WRONG, try again trick!"
        puts " "
    end
 
    # receives user input
    def get_input
        gets.chomp
    end

    # iterates over Queens array & displays each queen's name listed in numerical index format
    def list_queens
        Queens.all.each.with_index(1) do |queen, index|
            puts "#{index}. #{queen.name}"
        end

        queens_details_menu_options
    end

    # instructs user to select which queen they would like to see details from or exit program
    def queens_details_menu_options 
        puts "Choose your Queen, darling! Enter the number you wish to see."
        puts "Or type 'bye' to get out of here!"
        queens_details_menu
    end

    # takes user input for which option they would like. Uses control flow. If user wants to see queens information then print_queens_details method is called, or exit, or invalid choice.
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

    # structures information of drag queens. displays name, winning status & famous quote
    def print_queens_details(queen)
        puts "********************"
        puts " "
        puts "Queen Name: #{queen.name}"
        puts "Were they a winner? #{queen.winner}"
        puts "Famous for saying... #{queen.quote}"
        puts " "
        puts "********************"
    end

    # control flow method that allows user to select another queen or exit program
    def select_again_or_exit
        puts "Well, would you like to see more Glam Gals?"
        puts "'more' for main menu"
        puts "'bye' to get the hell outta here!"
        input = get_input

        if input == "more"
            list_queens
            queens_details_menu_options
            
        elsif input == "bye"
            puts "See you around, gorgeous!"
            exit
        else
            invalid_choice
            select_again_or_exit
        end
    end



end
