require_relative 'q1_family_member'
require_relative 'q1_io'

# This class is the main class
#
class Main
  attr_accessor :family_member_list  #=> varialbe holds five family members

  def initialize
  	self.seed_data
  end

# Method displays the main menue and call other method if required
#
  def menu
    welcomeText = "\nWelcome to Joe Bloggs' Family Member System\n"
    puts welcomeText  #=> this will be displayed at the beginning of the app

    puts"===================SAMPLE====================="
    puts self.family_member_to_s_each
    @family_member_list.each {|fm|  test_type_of_family_member(fm)}
    puts"====================SAMPLE END====================\n"

  	num = 0
  	begin
  	  puts "1 Show all famliy members(each loop) \n
        2 Show all famliy members(do loop)\n
        3 Show Speding list of a famliy member\n
        4 Show type of a famliy member \n
        5 Save famliy member and spending list to text file \n
        6 Exit\n"
      puts "Enter a number"
      num = gets
      num = num.chomp
      case
      when num == "1"
    	puts self.family_member_to_s_each
      when num == "2"
    	puts self.family_member_to_s_do
      when num == "3"
    	self.search_a_family_member_for_spending_list
      when num == "4"
      	self.search_a_family_member_for_type
      when num == "5"
    	save_list(self.family_member_and_spending_list_to_s_do)
      when num == "6"
		abort("See you!")
      end
  	end until num == "5"

  end
  
  # Search a family member with a firstname
  def search_a_family_member_for_spending_list
    puts "Enter a first name"
    fname = gets

    result = self.search_family_member_by_first_name(fname.chomp)
    if result.class != String
    	puts result
    	puts result.spending_list_to_s
    else
    	puts "No record"
    end
  end

  def search_a_family_member_for_type
    puts "Enter a first name"
    fname = gets

    result = self.search_family_member_by_first_name(fname.chomp)
    if result.class != String
    	self.test_type_of_family_member(result)
    	puts result.spending_list_to_s
    else 
      puts "No record"
    end

  end

  def seed_data
  	@family_member_list = Array.new

    fm1 = FamilyMember.new
    fm1.status = FamilyMember.STATUS[:married]

    fm1.add_item_to_spending_list(Spending.new(9.99, "Beer"))
    fm1.add_item_to_spending_list(Spending.new(50, "Petrol"))

    fm2 = FamilyMember.new("Marry", "Bloggs", "Female", 24, FamilyMember.STATUS[:married])
    fm2.add_item_to_spending_list(Spending.new(40, "food"))
    fm2.add_item_to_spending_list(Spending.new(30, "Makeup"))
    fm2.add_item_to_spending_list(Spending.new(9.99, "Flower"))


    fm3 = FamilyMember.new("Jack", "Bloggs", "Male", 2, FamilyMember.STATUS[:single])
    fm3.add_item_to_spending_list(Spending.new(9.99, "baby food"))
    fm3.add_item_to_spending_list(Spending.new(20, "baby food"))
    fm3.add_item_to_spending_list(Spending.new(10, "baby food"))
    fm3.add_item_to_spending_list(Spending.new(20, "baby food"))

    fm4 = FamilyMember.new("Emma", "Bloggs", "Female", 1, FamilyMember.STATUS[:single])
    fm4.add_item_to_spending_list(Spending.new(40, "baby food"))
    fm4.add_item_to_spending_list(Spending.new(40, "baby food"))
    fm4.add_item_to_spending_list(Spending.new(40, "baby food"))

    fm5 = FamilyMember.new("Max", "Bloggs", "Male", 4, FamilyMember.STATUS[:dog])
    fm5.add_item_to_spending_list(Spending.new(40, "dog food"))
    fm5.add_item_to_spending_list(Spending.new(5, "dog shampoo"))

    @family_member_list << fm1
    @family_member_list << fm2
    @family_member_list << fm3
    @family_member_list << fm4
    @family_member_list << fm5
  end

  def family_member_to_s_each
  	str = "Firstname \t Surname \t Sex \t Status \t Age \n"

  	@family_member_list.each {|fm| (str << fm.to_s + "\n")}

  	str
  end

  def family_member_to_s_do
  	str = "Firstname \t Surname \t Sex \t Status \t Age \n"

  	@family_member_list.each do |fm|
  	  str << fm.to_s + "\n"
  	end

  	str
  end

  def family_member_and_spending_list_to_s_do
  	str = "Firstname \t Surname \t Sex \t Status \t Age \n"

  	@family_member_list.each do |fm|
  	  str << fm.to_s + "\n" <<fm.spending_list_to_s
  	end
  	puts str
  	str
  end

  def test_type_of_family_member(fm)
    if fm.father?
      puts fm.firstname + " " + fm.surname + " " + "is father"
    elsif fm.mother?
      puts fm.firstname + " " + fm.surname + " " + "is mother"
    elsif fm.son?
      puts fm.firstname + " " + fm.surname + " " + "is son"
    elsif fm.daughter?
      puts fm.firstname + " " + fm.surname + " " + "is daughter"
    elsif fm.dog?
      puts fm.firstname + " " + fm.surname + " " + "is dog"
    elsif fm.cat?
      puts fm.firstname + " " + fm.surname + " " + "is cat"
    end
  end



  def search_family_member_by_first_name(fn)
  	@family_member_list.each do |fm|
  	  if fm.firstname.downcase == fn.downcase
  	  	return fm
  	  end
  	end
  	"No record"
  end

end

main = Main.new

main.menu