module ApplicationHelper
  def price_format(price)
    price.to_s(:currency, precision: 0, format: "%u%n",unit: "¥ ")
  end
end
