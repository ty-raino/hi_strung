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
        puts ""
        puts "Please enter 'electric' or 'acoustic'".yellow.bold
        puts "Type 'exit' to exit".yellow.bold
        puts "__________________"
        puts ""
        print "Enter here: "

        
        while (input = gets.strip.downcase) != 'exit'
            sleep(2)
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
        puts "Enter 'telecaster' for more information on Fender Telecaster".yellow.bold
        puts "Enter 'les paul' for more information on Gibson Les Paul".yellow.bold
        puts "Enter 'strats' for more information on Fender Stratocaster".yellow.bold
        puts "Enter 'sg' for more information on Gibson SG".yellow.bold
        puts "Enter 'jazzmaster' for more information on Fender Jazzmaster".yellow.bold
        puts "_____________"        
        print "Enter here: "
      input = gets.strip.downcase

      case input
      when "telecaster"
      e = HiStrung::Guitar.electrics[0]
      puts ""
      puts "   ✨|POPULAR PRODUCT|✨".bold.light_white
      puts HiStrung::Scraper.get_electric_info(e).red.bold.underline + " | $499".white
      puts ""
      puts "Maple Fingerboard, 3-Color Sunburst Bold, innovative and rugged, the Player Telecaster is pure Fender, through and through. The feel, the style and, most importantly, the sound. They’re all there, waiting for you to make them whisper or wail for your music. Versatile enough to handle almost anything you can create and durable enough to survive any gig, this workhorse is a trusty sidekick for your musical vision.".light_white
      puts ""
      puts confirm_selection
      when "les paul"
      e = HiStrung::Guitar.electrics[1]
      puts ""
      puts "   ✨|POPULAR PRODUCT|✨".bold.light_white
      puts HiStrung::Scraper.get_electric_info(e).red.underline + " | $599".white
      puts ""
      puts "Building even further on one of the most legendary series of guitars ever produced, the Epiphone Les Paul Standard Plus Top Pro brings together beauty and braun in one package. Packing the same solid mahogany body and AAA flame maple top as its predecessor.".light_white   
      when "strats"
      e = HiStrung::Guitar.electrics[2]
      puts ""
      puts "   ✨|POPULAR PRODUCT|✨".bold.light_white
      puts HiStrung::Scraper.get_electric_info(e).red.underline + " | $674.99".white
      puts ""
      puts "For those after the original slap, twang, and roar of an electric guitar icon, the Fender Player Stratocaster delivers classic tone with a fleet of modern features at an attractive price.".light_white
      when "sg"
        e = HiStrung::Guitar.electrics[3]
      puts ""
      puts "   ✨|POPULAR PRODUCT|✨".bold.light_white
      puts HiStrung::Scraper.get_electric_info(e).red.underline + " | $1,499".white
      puts ""
      puts "Like the greatest SGs ever made, the SG Standard starts with a foundation of solid mahogany, a tonewood with a long tradition at Gibson. A solid mahogany body is crafted in the distinctive, thin asymmetrical dual-cutaway style, with iconic pointed “horns” and beveled edges to enhance playing comfort.".light_white
      when "jazzmaster"
        e = HiStrung::Guitar.electrics[4]
        puts ""
        puts "   ✨|POPULAR PRODUCT|✨".bold.light_white
        puts HiStrung::Scraper.get_electric_info(e).red.underline + " | $674.99".white
        puts ""
        puts "The Classic Vibe ‘60s Jazzmaster is a faithful and striking homage to the iconic Fender favorite, producing undeniable Jazzmaster tone courtesy of its dual Fender-Designed alnico single-coil pickups. Player-friendly features include a slim, comfortable “C”-shaped neck profile with an easy-playing 9.5”-radius fingerboard and narrow-tall frets, a vintage-style tremolo system for expressive string bending effects, and a floating bridge with barrel saddles for solid string stability.".light_white
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