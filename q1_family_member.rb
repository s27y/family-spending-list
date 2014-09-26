require_relative 'q1_spending'

# a class represent FamilyMember
class FamilyMember
  attr_accessor :firstname, :surname, :sex, :age, :status, :spending_list
  @@STATUS = { :single => 1, :married => 2 }

  def initialize(fn = "Joe", su = "Bloggs", sex = "Male", age = 25, status = FamilyMember.STATUS[:single])
    @firstname, @surname, @sex, @age, @status = fn,su,sex,age,status
    @spending_list = Array.new
  end

  def self.STATUS
    @@STATUS
  end

  def total_spending
  	total = 0
  	if !spending_list.empty?
  	  for spending in spending_list
  	    total += spending.amount
  	  end
  	end
  	total
  end

  def print_spending_list
    output = ""
    if !spending_list.empty?
  	  for spending in spending_list
        output << (spending_list.index(spending)+1).to_s+"\t" << spending.to_s << "\n"
  	  end
    end
    output
  end

  def to_s
    "FamilyMember: #{self.firstname} #{self.surname}"
  end

end

p1 = FamilyMember.new

puts p1

p1.spending_list << Spending.new(20.99,"food");
puts p1.spending_list.size
p1.spending_list << Spending.new(20.99,"food");
puts p1.spending_list.size


puts p1.total_spending
puts p1.print_spending_list