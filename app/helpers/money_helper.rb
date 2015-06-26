module MoneyHelper
  def format_money(amount_in_cents)
    number_to_currency(amount_in_cents.to_f/100)
  end
end
