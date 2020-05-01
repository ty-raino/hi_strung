require 'colorize'
# controller
class HiStrung::CLI

    def call 
        list_categories
        menu
        user_input
        goodbye
    end

    def list_categories
        puts "      HiStrung 🎸".bold.light_red
        puts "Find your new guitar today!".light_yellow
        puts ""
        sleep(1)
        puts "  -CATEGORIES-".italic.red

        categories = HiStrung::Scraper.get_categories
        categories.each do |category|
            puts "|#{category}|".italic.red
        end
        
    end

    def menu
        puts ""
        puts "What type of guitar are you looking for?"
        sleep(1)
        puts ""
        puts "Please enter 'electric' or 'acoustic'"
        puts "Type 'exit' to exit"
        puts "__________________"
        puts ""
        print "Enter here: "

        
        while (input = gets.strip.downcase) != 'exit'

            case input
            when "electric"
                puts ""
               electrics = HiStrung::Scraper.get_electric
               electrics.each.with_index(1) do |electric, index|
                puts "#{index}) #{electric[:name]}".red.bold + " - #{electric[:url]}".light_white
               end

                puts "__________________"
                puts ""
                print "Enter here: "
            when "acoustic"
                puts ""
                acoustics = HiStrung::Scraper.get_acoustic
                acoustics.each.with_index(1) do |acoustic, index|
                 puts "#{index}. #{acoustic[:name]}".red.bold + " - #{acoustic[:url]}".light_white
                end
                puts "Please enter a number"
                input = gets.strip.to_i
                puts "__________________"
                puts ""
                print "Enter here: "
            else 
                puts "'#{input}' is not a valid response!"
                puts "Please enter 'electric' or 'acoustic'"
                puts "__________________"
                puts ""
                print "Enter here: "
        end
    end
end

    def user_input


    end
            
    def goodbye
        puts "__________________"
        puts ""
        puts "Thank you for browsing!"
    end

end