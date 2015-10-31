class CustomSeafoodCell < PM::TableViewCell

  def on_load
    @image = append(UIImageView, :image_style) 
    @name = append(UILabel, :name_text_style)
    @price = append(UILabel, :price_text_style)
    @city = append(UILabel, :city_text_style)
    rmq.all.reapply_styles
  end

  def price= per_pound_price
    @price.data = per_pound_price
  end

  def name= what_dat_name
    @name.data = what_dat_name
  end

  def city= where_it_is
    @city.data = where_it_is
  end
end