class Vendor < ActiveRecord::Base
  belongs_to :market
  has_many :sales
  has_many :products

  validates_presence_of :name, :number_of_employees, :market_id
  validates_numericality_of :number_of_employees, :market_id

  def recent_sales_first(how_many=sales.count)
    sorted_sales = sales.sort_by { |sale| sale.purchase_time }
    sorted_sales.reverse!

    return sorted_sales[0, how_many]
  end

  def total_sales
    all_sales = sales
    amounts = all_sales.map { |sale| sale.amount }
    total = amounts.inject { |sum, n| sum + n }

    return total
  end

  def month_sales
    current_month = Time.now.month
    current_month_sales = []

    sales.each do |sale|
      current_month_sales.push(sale) if sale.purchase_time.month == current_month
    end

    return current_month_sales
  end

  def month_recent_sales_first
    sorted_sales = month_sales.sort_by { |sale| sale.purchase_time }
    sorted_sales.reverse!
    
    return sorted_sales.slice(0, how_many)
  end

  def month_total_sales
    all_sales = sales
    amounts = month_sales.map { |sale| sale.amount }
    total = amounts.inject { |sum, n| sum + n }

    return total
  end
end
