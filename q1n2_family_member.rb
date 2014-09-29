require_relative 'q1_spending'

# a class represent FamilyMember
class FamilyMember
  attr_accessor :firstname, :surname, :sex, :age, :status, :spending_list
  @@STATUS = { :single => "single", :married => "married" , :dog => "dog", :cat => "cat"}

  def initialize(fn = "Joe", su = "Bloggs", sex = "Male", age = 25, status = FamilyMember.STATUS[:single])
    @firstname, @surname, @sex, @age, @status = fn,su,sex,age,status
    @spending_list = Array.new
    @relation_list = Hash.new
  end

  def self.STATUS
    @@STATUS
  end

  def child?
     @age < 16 && @status == FamilyMember.STATUS[:single]
  end

  def son?
   self.child? && @sex == "Male"
  end

  def daughter?
   self.child? && @sex == "Female"
  end

  def parent?
    @age >= 16 && @status == FamilyMember.STATUS[:married]
  end

  def father?
    self.parent? && @sex == "Male"
  end

  def mother?
    self.parent? && @sex == "Female"
  end


  def pet?
    @status == FamilyMember.STATUS[:dog] || @status == FamilyMember.STATUS[:cat]
  end

  def dog?
     @status == FamilyMember.STATUS[:dog]
  end

  def cat?
     @status == FamilyMember.STATUS[:cat]
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

  def spending_list_to_s
    output = "No. \t Item \t Price\n"
    if !spending_list.empty?
  	  for spending in spending_list
        output << (spending_list.index(spending)+1).to_s+"\t" << spending.to_s << "\n"
  	  end
      output << "TOTAL \t\t " << self.total_spending.to_s
    end
    output
  end

  def add_item_to_spending_list(a_spending)
    if a_spending.is_a?(Spending)
      spending_list << a_spending
    end
  end


  def to_s
    "#{self.firstname} \t\t #{self.surname} \t #{self.sex} \t #{self.status} \t #{self.age}"
  end

end

