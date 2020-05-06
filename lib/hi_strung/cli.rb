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
        puts "      HiStrung 🎸".bold.light_red
        puts "Find your new guitar today!".light_yellow
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
        puts "What type of guitar are you looking for?".white
        sleep(1)
        puts ""
        puts "Please enter 'electric' or 'acoustic'".yellow
        puts "Type 'exit' to exit".yellow
        puts "__________________"
        puts ""
        print "Enter here: "

        
        while (input = gets.strip.downcase) != 'exit'

            case input
            when "electric"
                puts ""
                display_electric

                puts "__________________"
                puts ""
                print "Enter here: "
            when "acoustic"
                puts ""
                display_acoustic
               
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

    def display_electric
        HiStrung::Guitar.electrics.each.with_index(1) do |electric, index|
            puts "#{index}. #{electric.name}".red.bold + " - #{electric.url}".light_white
        end
        puts ""
        puts "Enter 'telecaster' for more information on the Fender Telecaster".yellow.bold
        puts "Enter 'les paul' for more information on the Gibson Les Paul".yellow.bold
        puts "Enter 'strats' for more information on the Fender Stratocaster".yellow.bold
        puts "Enter 'sg' for more information on the Gibson SG".yellow.bold
        puts "Enter 'jazzmaster' for more information on the Fender Jazzmaster".yellow.bold
        puts "_____________"        
        print "Enter here: "
      input = gets.strip.downcase

      case input
      when "telecaster"
      e = HiStrung::Guitar.electrics[0]
      puts ""
      puts HiStrung::Scraper.get_electric_info(e).red.bold.underline + " | $499".white
      puts ""
      puts "                                       - DESCRIPTION -".light_yellow
      puts "Maple Fingerboard, 3-Color Sunburst Bold, innovative and rugged, the Player Telecaster is pure Fender, through and through. The feel, the style and, most importantly, the sound—they’re all there, waiting for you to make them whisper or wail for your music. Versatile enough to handle almost anything you can create and durable enough to survive any gig, this workhorse is a trusty sidekick for your musical vision.".bold.light_red
      puts ""
      puts confirm_selection
      when "les paul"
        
      when "strats"
        puts "stratocaster"
      when "sg"
        puts "gibson"
      when "jazzmaster"
        puts "jazzmaster"
      end
    end

    def display_acoustic
        HiStrung::Guitar.acoustics.each.with_index(1) do |acoustic, index|
            puts "#{index}. #{acoustic.name}".red.bold + " - #{acoustic.url}".light_white
        end
    end 

    def confirm_selection
    end
      
    def goodbye
        puts "__________________"
        puts ""
        puts "Thank you for browsing!"
    end

end