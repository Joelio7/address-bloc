
require_relative '../models/address_book.rb'

 RSpec.describe AddressBook do
   let(:book) {AddressBook.new}
   context "attributes" do
     it "should respond to entries" do
       book = AddressBook.new
       expect(book).to respond_to(:entries)
     end

     it "should initialize entries as an array" do
       book = AddressBook.new
       expect(book.entries).to be_a(Array)
     end

     it "should initialize entries as empty" do
       book = AddressBook.new
       expect(book.entries.size).to eq 0
     end
   end

   context "#add_entry" do
     it "adds only one entry to the address book" do
       book = AddressBook.new
       book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')

       expect(book.entries.size).to eq 1
     end

     it "adds the correct information to entries" do
       book = AddressBook.new
       book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
       new_entry = book.entries[0]

       expect(new_entry.name).to eq 'Ada Lovelace'
       expect(new_entry.phone_number).to eq '010.012.1815'
       expect(new_entry.email).to eq 'augusta.king@lovelace.com'
     end
     def check_entry(entry, expected_name, expected_number, expected_email)
         expect(entry.name).to eql expected_name
         expect(entry.phone_number).to eql expected_number
         expect(entry.email).to eql expected_email
       end

   context ".import_from_csv" do
     it "imports the correct number of entries" do
 # #3
       book.import_from_csv("entries.csv")
       book_size = book.entries.size

       # Check the size of the entries in AddressBook
       expect(book_size).to eql 5
     end
     it "imports the 1st entry" do
       book.import_from_csv("entries.csv")
       # Check the first entry
       entry_one = book.entries[0]
       check_entry(entry_one, "Bill", "555-555-4854", "bill@blocmail.com")

     end

     it "imports the 2nd entry" do
       book.import_from_csv("entries.csv")
       # Check the second entry
       entry_two = book.entries[1]
       check_entry(entry_two, "Bob", "555-555-5415", "bob@blocmail.com")

     end

     it "imports the 3rd entry" do
       book.import_from_csv("entries.csv")
       # Check the third entry
       entry_three = book.entries[2]
       check_entry(entry_three, "Joe", "555-555-3660", "joe@blocmail.com")

     end

     it "imports the 4th entry" do
       book.import_from_csv("entries.csv")
       # Check the fourth entry
       entry_four = book.entries[3]
       check_entry(entry_four, "Sally", "555-555-4646", "sally@blocmail.com")

     end
     def check_entry(entry, expected_name, expected_number, expected_email)
         expect(entry.name).to eql expected_name
         expect(entry.phone_number).to eql expected_number
         expect(entry.email).to eql expected_email
       end

        context ".import_from_csv" do
         it "imports the correct number of entries" do
       # #3
           book.import_from_csv("entries_2.csv")
           book_size = book.entries.size

           # Check the size of the entries in AddressBook
           expect(book_size).to eql 3
     end
     it "imports the 6th entry" do
       book.import_from_csv("entries_2.csv")
       entry_six = book.entries[0]
       check_entry(entry_six, "Arnold","777-421-5079", "heyarnold@bloc.com")

     end
    it "imports the 7th entry" do
      book.import_from_csv("entries_2.csv")
      entry_seven = book.entries[1]
      check_entry(entry_seven, "Gerald","457-899-4800","ballislife@yahoo.com")
    end
    it "imports the 8th entry" do
      book.import_from_csv("entries_2.csv")
      entry_eight = book.entries[2]
      check_entry(entry_eight, "Kobe", "356-990-3467","coffedrank@uplate.com")
    end
   end
end
end
end
