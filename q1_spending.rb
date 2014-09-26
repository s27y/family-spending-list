class Spending
  attr_reader :amount, :item

  def initialize(amount, item)
    @amount, @item = amount, item
  end

  def to_s
  	"amount:#{@amount} \t on #{@item}"
  end

end

s = Spending.new(20.99, "book")

p s.to_s