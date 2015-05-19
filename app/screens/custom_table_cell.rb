class CustomCell < PM::TableViewCell

  def on_load
    @price = rmq.append(UILabel, :price_text_style)
    rmq.all.reapply_styles
  end

  def price= per_pound_price
    @price.data = per_pound_price
  end
end