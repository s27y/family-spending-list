require_relative 'q1_family_member'

class Main
  attr_accessor :family_member_list

  def initialize
  	self.seed_data
  end


  def menu
  	num = 0
  	begin
    puts "Enter a number"
    num = gets
  		
  	end until num = 2




    puts "Enter a first name"
    fname = gets

    puts self.search_family_member_by_first_name(fname.chomp).to_s

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


    fm3 = FamilyMember.new("Jack", "Bloggs", "male", 2, FamilyMember.STATUS[:single])
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


    fm21 = FamilyMember.new("John", "Smith", "Female", 30, FamilyMember.STATUS[:married])

    fm22 = FamilyMember.new("Amy", "Smith", "Female", 32, FamilyMember.STATUS[:married])

    fm23 = FamilyMember.new("Liam", "Smith", "male", 3, FamilyMember.STATUS[:single])

    fm24 = FamilyMember.new("Ana", "Smith", "Female", 6, FamilyMember.STATUS[:single])

    fm25 = FamilyMember.new("Lucy", "Smith", "Female", 4, FamilyMember.STATUS[:cat])
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
puts main.family_member_to_s_each

main.menu