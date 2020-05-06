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
        puts electric_commands
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
        # puts ""
        # puts confirm_selection
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
        puts ""
        puts acoustic_commands
        puts "_____________"        
        print "Enter here: "
        input = gets.strip.downcase

        case input
        when 'gs mini'
            a = HiStrung::Guitar.acoustics[0]
            puts ""
            puts "   ✨|POPULAR PRODUCT|✨".bold.light_white
            puts HiStrung::Scraper.get_acoustic_info(a).red.underline + " | $799".white
            puts "The Taylor GS Mini-e Koa acoustic-electric guitar is a limited-run instrument that sounds as gorgeous as it looks. With Hawaiian koa top and veneered koa back and sides, the GS Mini-e Koa has an undeniably warm sound and blooming harmonic overtones, especially for such a small instrument.".light_white
        when "lx"
            a = HiStrung::Guitar.acoustics[1]
            puts ""
            puts "   ✨|POPULAR PRODUCT|✨".bold.light_white
            puts HiStrung::Scraper.get_acoustic_info(a).red.underline + " | $349".white
            puts "The Martin LX1 'Little Martin' compact travel guitar has a tone that defies its size and price. The LX1 features a hand-rubbed solid spruce top, just like the top-of-the-line Martin guitars and boasts truly great playability that make the Little Martin a perfect choice for a travel instrument.".light_white
        when "d-18"
            a = HiStrung::Guitar.acoustics[2]
            puts ""
            puts "   ✨|POPULAR PRODUCT|✨".bold.light_white
            puts HiStrung::Scraper.get_acoustic_info(a).red.underline + " | $1,700".white
            puts "The Martin D-18 stands as one of the true original dreadnoughts introduced by Martin in 1932. The D-18 made a switch from a 12-fret to a 14-fret instrument in 1934 and has stayed largely the same since, with just the occasional change in wood source or cosmetic detail. Since the D-18 uses Mahogany instead of Rosewood, it is thought to have a somewhat crisper sound with more definition.".light_white
        when "j-45"
            a = HiStrung::Guitar.acoustics[3]
            puts ""
            puts "   ✨|POPULAR PRODUCT|✨".bold.light_white
            puts HiStrung::Scraper.get_acoustic_info(a).red.underline + " | $2,749".white
            puts "The Gibson J-45 acoustic guitar can be heard across decades of recordings in the hands of country stars, folk legends, singer-songwriters and solo instrumentalists. It is one of America's most iconic acoustic guitars. It's sloped shoulders and more mellow tone set it apart from Martin's legendary dreadnoughts.".light_white
        when "d-28"
            a = HiStrung::Guitar.acoustics[4]
            puts ""
            puts "   ✨|POPULAR PRODUCT|✨".bold.light_white
            puts HiStrung::Scraper.get_acoustic_info(a).red.underline + " | $2,899".white
            puts "Sometimes innovation is in the details and this is certainly true with Martin’s re-imagined D-28. After nearly a century at the helm, and as the quintessential workhorse of music legends like Hank Williams, The Beatles, Johnny Cash, Neil Young, Bob Dylan, and so many more, Martin's legendary D-28 has been lovingly and artfully enhanced.".light_white
        when "114"
            a = HiStrung::Guitar.acoustics[5]
            puts ""
            puts "   ✨|POPULAR PRODUCT|✨".bold.light_white
            puts HiStrung::Scraper.get_acoustic_info(a).red.underline + " | $650".white
            puts "Built in Mexico and with a definitive and all-around masterful voice, this guitar features a Grand Auditorium body style, built from a solid Sitka spruce top on a layered walnut back and sides, which together produce signature clear and balanced tone with a pleasing projection and midrange focus.".light_white
        when "hummingbird"
            a = HiStrung::Guitar.acoustics[6]
            puts ""
            puts "   ✨|POPULAR PRODUCT|✨".bold.light_white
            puts HiStrung::Scraper.get_acoustic_info(a).red.underline + " | $3,849".white
            puts "The Gibson Hummingbird stands as one of the most iconic acoustic guitars of all time. This square-shoulder dreadnought is most commonly found with mahogany back and sides and a distinct cherry sunburst finish. Its distinct style and well-rounded tone has been favored by players like Keith Richards and Sheryl Crow.".light_white
        end
    end
    
    def electric_commands
        puts "Enter 'telecaster' for more information on Fender Telecaster".yellow.bold
        puts "Enter 'les paul' for more information on Gibson Les Paul".yellow.bold
        puts "Enter 'strats' for more information on Fender Stratocaster".yellow.bold
        puts "Enter 'sg' for more information on Gibson SG".yellow.bold
        puts "Enter 'jazzmaster' for more information on Fender Jazzmaster".yellow.bold
    end

    def acoustic_commands
        puts "Enter 'GS Mini' for more information on Taylor GS Mini".yellow.bold
        puts "Enter 'LX' for more information on Martin LX".yellow.bold
        puts "Enter 'D-18' for more information on Martin D-18".yellow.bold
        puts "Enter 'J-45' for more information on Gibson J-45".yellow.bold
        puts "Enter 'D-28' for more information on Martin D-28".yellow.bold
        puts "Enter '114' for more information on Taylor 114".yellow.bold
        puts "Enter 'Hummingbird' for more information on Gibson Hummingbird".yellow.bold
    end

    def confirm_selection
    end
      
    def goodbye
        puts "__________________"
        puts ""
        puts "Thank you for browsing!"
    end

end