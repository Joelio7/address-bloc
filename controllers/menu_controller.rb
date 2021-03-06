require_relative "../models/address_book"


class MenuController
  attr_accessor :address_book

  def initialize
    @address_book = AddressBook.new
  end

  def main_menu
    puts "Main Menu - #{@address_book.entries.count} entries"
    puts "1 - View all entries"
    puts "2 - View Entry Number n"
    puts "3 - Create an entry"
    puts "4 - Search for an entry"
    puts "5 - Import entries from a CSV"
    puts "6 - Exit"
    puts "7 - Nuke all entries"
    print "Enter your selection: "

    selection = gets.to_i
    puts "You picked #{selection}"
    # #7
    case selection
    when 1
      system "clear"
      view_all_entries
      main_menu
    when 2
      system "clear"
      view_entry_number_n
      main_menu
    when 3
      system "clear"
      create_entry
      main_menu
    when 4
      system "clear"
      search_entries
      main_menu
    when 5
      system "clear"
      read_csv
      main_menu
    when 6
      puts "Good_bye"
      exit(0)
    when 7
      system "clear"
      nuke_all
      main_menu

    else
      system "clear"
      puts "Sorry, that is not a valid input"
      main_menu
    end
  end

  def create_entry
    system "clear"
    puts "New AddressBloc Entry"
    print "Name: "
    name = gets.chomp
    print "Phone number: "
    phone = gets.chomp
    print "Email: "
    email = gets.chomp

    @address_book.add_entry(name, phone, email)

    system "clear"
    puts "New entry created"
  end

  def view_all_entries
    @address_book.entries.each do |entry|
      system "clear"
      puts entry.to_s
      entry_submenu(entry)
    end

    system "clear"
    puts "End of entries"
  end

  def view_entry_number_n
    cnt = address_book.entries.count
    if cnt > 0
    print "Entry to view (1 - #{cnt}): "
    selection = gets.to_i
    if (1..cnt).include?(selection)
      puts address_book.entries[selection - 1].to_s
    else
      puts "Invalid selction."
    end
    else
      puts "No entries to view"
    end
    end


  def entry_submenu(entry)
    puts "n - next entry"
    puts "d - delete entry"
    puts "e - edit this entry"
    puts "m - return to main menu"


    selection = gets.chomp
    case selection # #18
    when "n" # #19
    when "d"
      delete_entry(entry)
    when "e"
      edit_entry(entry)
      entry_submenu(entry) # #20
    when "m"
      system "clear"
      main_menu

    else
      system "clear"
      puts "#{selection} is not a valid input"
      entries_submenu(entry)
    end
  end

  def read_csv
 # #1
    print "Enter CSV file to import: "
    file_name = gets.chomp
 # #2
    if file_name.empty?
      system "clear"
      puts "No CSV file read"
      main_menu
    end

    begin
      entry_count = @address_book.import_from_csv(file_name).count
      system "clear"
      puts "#{entry_count} new entries added from #{file_name}"
    rescue => e
      puts e
      puts "#{file_name} is not a valid CSV file, please enter the name of a valid CSV file"
      read_csv
    end
  end

  def delete_entry(entry)
    @address_book.entries.delete(entry)
    puts "#{entry.name} has been deleted"
  end

  def edit_entry(entry)
    print "Updated name: "
    name = gets.chomp
    print "Updated phone number: "
    phone_number = gets.chomp
    print "Updated email: "
    email = gets.chomp
 # #5
    entry.name = name if !name.empty?
    entry.phone_number = phone_number if !phone_number.empty?
    entry.email = email if !email.empty?
    system "clear"
 # #6
    puts "Updated entry:"
    puts entry
  end

  def nuke_all
    entries = address_book.entries.dup
        for entry in entries
          delete_entry(entry)
    end
  end
  def search_entries
    # #9
    print "Search by name:"
    name = gets.chomp
    # #10
    match = @address_book.binary_search(name)
    system "clear"
    # #11
    if match
      puts match.to_s
      search_submenu(match)
    else
      puts "No match found for #{name}"
    end
  end

  def search_submenu(entry)
    # #12
    puts "\nd - delete entry"
    puts "e - edit this entry"
    puts "m - return to main menu"
    # #13
    selection = gets.chomp

    # #14
    case selection
    when "d"
      system "clear"
      delete_entry(entry)
      main_menu
    when "e"
      edit_entry(entry)
      system "clear"
      main_menu
    when "m"
      system "clear"
      main_menu
    when "z"
      system "clear"
      nuke_all(entries)
      main_menu
    else
      system "clear"
      puts "#{selection} is not a valid input"
      puts entry.to_s
      search_submenu(entry)
    end
  end
end
