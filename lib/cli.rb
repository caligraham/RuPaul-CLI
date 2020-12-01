class Cli

    def start
        print "Welcome racers, start your engines please! Press any key to continue."
        puts "Vroom vroom, loading herstorical Queens...."
        Api.load_data
        main_menu_options
    end

    def main_menu_options
        puts "Type werk, to see a list of Queens!"
        puts "Type bye, to exit the program"
        main_menu
    end

    def main_menu
        input = get_input

        if input == "werk"
            puts "Getting your Queens"
        elsif input == "bye"
            puts "Don't let the door hit you on the way out"
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
    print "Pick your poison"
    gets.chomp
end

end
