# controller
class HiStrung::CLI

    def call 
        list_guitars
        menu
        goodbye
    end

    def list_guitars
        puts "      HiStrung 🎸"
        puts "Find your new guitar today!"
        puts ""

        puts "   -Categories-"

      puts <<~DOC
      |Acoustic         |
      |Electric         |
      |Bass             |
      |Ukulele          |
      |Banjo            |
      |Left-hand guitars|
     DOC

     puts "___________________"
    end

    def menu
        puts ""
        puts "What type of guitar are you looking for?"
        puts "Type 'help' for commands"
        puts "Type 'exit' to exit"
        puts "__________________"
        puts ""
        print "Enter here: "

        
        while (input = gets.strip.downcase) != 'exit'

            case input
            when "acoustic"
                puts "Guitar 1, Description, price"
                puts "Guitar 2, Description, price"
                puts "__________________"
                puts ""
                print "Enter here: "
            when "electric"
                puts "Guitar 1, Description, price"
                puts "Guitar 2, Description, price"
                puts "__________________"
                puts ""
                print "Enter here: "
            when "bass"
                puts "Bass 1, Description, price"
                puts "Bass 2, Description, price"
                puts "__________________"
                puts ""
                print "Enter here: "
            when "ukulele"
                puts "Ukulele 1, Description, price"
                puts "Ukulele 2, Description, price"
                puts "__________________"
                puts ""
                print "Enter here: "
            when "banjo"
                puts "Banjo 1, Description, price"
                puts "Banjo 2, Description, price"
                puts "__________________"
                puts ""
                print "Enter here: "
            when "left-hand guitars"
                puts "Guitar 1, Description, price"
                puts "Guitar 2, Description, price"
                puts "__________________"
                puts ""
                print "Enter here: "
            when 'help'
                puts "__________________"
                puts ""
                puts "-COMMANDS-"
                puts "Acoustic"
                puts "Electric"
                puts "Bass"
                puts "Ukulele"
                puts "Banjo"
                puts "Left-hand guitars"
                puts "Help"
                puts "Exit"
                puts "__________________"
                puts ""
                print "Enter here: "
            else 
                puts "'#{input}' is not a valid response!"
                puts "Type 'help' for commands"
                puts "__________________"
                puts ""
                print "Enter here: "
        end
    end
end
            
  def goodbye
    puts "__________________"
    puts ""
    puts "Thank you for browsing!"
  end

end