require 'colorize'
# controller
class HiStrung::CLI
    
    def call 
        HiStrung::Scraper.get_electric
        HiStrung::Scraper.get_acoustic
        list_categories
        menu
        goodbye
    end

    def list_categories
        puts "  HiStrung 🎸".bold.light_red
        puts "Popular Guitars to browse!".light_yellow
        puts ""
        sleep(1)
        puts "  -CATEGORIES-".italic.yellow.bold

        categories = HiStrung::Scraper.get_categories
        categories.each do |category|
            puts "|#{category}|".italic.red
        end
    end

    def menu
        puts ""
        puts "Which category do you want to view?".white
        puts ""
        puts "Please enter 'Electric' or 'Acoustic'".yellow.bold
        puts "Type 'Exit' to exit".yellow.bold
        puts "__________________"
        puts ""
        print "Enter here: "

        while (input = gets.strip.downcase) != 'exit'
            sleep(2)
            case input
            when "electric"
                puts ""
                puts "           Top 5 electric guitars!".bold.light_yellow
                HiStrung::Guitar.electrics.each.with_index(1) do |electric, index|
                    puts "#{index}. #{electric.name}".red.bold + " - #{electric.url}".light_white
                end
                puts ""
                puts "__________________"
                puts ""
                puts "Please enter 'Electric' or 'Acoustic'".yellow.bold
                puts "Type 'Exit' to exit".yellow.bold
                print "Enter here: "
            when "acoustic"
                puts ""
                puts "           Top 9 acoustic guitars!".bold.light_yellow
                HiStrung::Guitar.acoustics.each.with_index(1) do |acoustic, index|
                    puts "#{index}. #{acoustic.name}".red.bold + " - #{acoustic.url}".light_white
                end
                
                puts ""
                puts "__________________"
                puts ""
                puts "Please enter 'Electric' or 'Acoustic'".yellow.bold
                puts "Type 'Exit' to exit".yellow.bold
                print "Enter here: "
            else 
                puts "'#{input}' is not a valid response!"
                puts "Please enter 'Electric' or 'Acoustic'"
                puts "__________________"
                puts ""
                print "Enter here: "
            end
        end
    end

    def goodbye
        puts "__________________"
        puts ""
        puts "Which guitar will you pick? Thank you for viewing!".bold.light_yellow
    end
end

