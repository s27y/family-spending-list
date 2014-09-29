class Spending
  attr_reader :amount, :item

  def initialize(amount, item)
    @amount, @item = amount, item
  end

  def to_s
  	"#{@item} \t #{@amount}"
  end

end
