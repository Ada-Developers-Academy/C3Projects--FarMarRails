module ApplicationHelper
    def cents_to_dollars(cents)
    num = (cents/100.to_f).to_s
    if num[-2] == "."
      num.insert(-1, "0")
    end
    return num
  end
end
