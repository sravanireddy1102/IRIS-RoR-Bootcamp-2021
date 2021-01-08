class Item
  CATEGORIES = {
    1 => 'Electronics/Gadgets',
    2 => 'Books',
    3 => 'Furniture',
    4 => 'Miscellaneous'
  }

  # TODO: Store quantity
  attr_accessor :name, :price, :category_id, :discount_rate,
    :discount_deadline
  attr_accessor :quantity

  def initialize(name: '', price: 0, quantity: 1, category_id: 4,
                 discount_rate: 0, discount_deadline: Time.now)
    @name = name
    @price = price
    @category_id = category_id
    @discount_rate = discount_rate
    @discount_deadline = discount_deadline
    @quantity = quantity
  end

  # Returns a boolean value whether than item is discounted i.e. the
  # discount deadline has been crossed or not.
  def discounted?
    if Time.now>discount_deadline
      return false
    end
    return true
  end
  #checking if current time is greater than discount deadline 

  # If the item is discounted, the current price is 
  # `price * (100 - discount rate) / 100`. Otherwise, it is same as the price.
  #
  # TODO: Implement instance method 'current_price'
  def current_price
    if discounted?
      return price * (100 - discount_rate) / 100
    else
      return price
    end
  end

  # The stock price of item is defined as product of current price and
  # quantity.
  # 
  # This function takes an Array of items as the parameter and returns
  # a hash with the category id as the key and sum of stock
  # prices of all items of that category as the value.
  #
  # Note: If there are no items for category, stock price for category
  # should be zero.
  def self.stock_price_by_category(items)
    stocks={
      1 => 0, 
      2 => 0,
      3 => 0,
      4 => 0
    }#initializing all the stock prices to zero basically dictionaries

    items.each do |item|
      stocks[item.category_id]+=item.current_price*item.quantity
    end
    #iterating over each item and updating the stockprices of each category
  return stocks
  end
end
