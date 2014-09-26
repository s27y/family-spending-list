require_relative 'q1_family_member'

def seed_data
    fm1 = FamilyMember.new
    fm1.status = FamilyMember.STATUS[:married]

    fm1.add_item_to_spending_list(Spending.new(9.99, "Beer"))
    fm1.add_item_to_spending_list(Spending.new(50, "Petrol"))

    fm2 = FamilyMember.new("Marry", "Bloggs", "Female", 24, FamilyMember.STATUS[:married])
    fm2.add_item_to_spending_list(Spending.new(40, "food"))
    fm2.add_item_to_spending_list(Spending.new(30, "Makeup"))


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

puts fm1.to_s


    fm21 = FamilyMember.new("John", "Smith", "Female", 30, FamilyMember.STATUS[:married])

    fm22 = FamilyMember.new("Amy", "Smith", "Female", 32, FamilyMember.STATUS[:married])

    fm23 = FamilyMember.new("Liam", "Smith", "male", 3, FamilyMember.STATUS[:single])

    fm24 = FamilyMember.new("Ana", "Smith", "Female", 6, FamilyMember.STATUS[:single])

    fm25 = FamilyMember.new("Lucy", "Smith", "Female", 4, FamilyMember.STATUS[:cat])


  end

  seed_data