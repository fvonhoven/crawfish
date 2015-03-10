class HomeScreen < PM::Screen
  title "Where Dat Crawfish"
  stylesheet HomeScreenStylesheet

  def on_load
    # TODO add image upload of pictures of people eating crawfish at the different places
    set_nav_bar_button :left, system_item: :camera, action: :nav_left_button
    # TODO build pickerView => screens
    set_nav_bar_button :right, title: "Find", action: :nav_right_button

    @picker = append!(UIPickerView, :picker)
    @picker.delegate = self
    @picker.dataSource = self

    @hello_world = append!(UILabel, :hello_world)
  end

  def nav_left_button
    mp 'Left button'
  end

  def nav_right_button
    mp 'Right button'
  end

  def numberOfComponentsInPickerView pickerView
    1
  end

  def pickerView(pickerView, numberOfRowsInComponent:component)
    4
  end

  def pickerView(pickerView, titleForRow:row, forComponent:component)
    case row
    when 0
      "Crawfish"
    when 1
      "Oysters"
    when 2
      "Shrimp"
    when 3
      "Crabs"
    #"I can count to #{row+1}"
    end
  end

  # def crawfish_screen
  #   open CrawfishScreen.new
  # end

  # You don't have to reapply styles to all UIViews, if you want to optimize, another way to do it
  # is tag the views you need to restyle in your stylesheet, then only reapply the tagged views, like so:
  #   def logo(st)
  #     st.frame = {t: 10, w: 200, h: 96}
  #     st.centered = :horizontal
  #     st.image = image.resource('logo')
  #     st.tag(:reapply_style)
  #   end
  #
  # Then in will_animate_rotate
  #   find(:reapply_style).reapply_styles#

  # Remove the following if you're only using portrait
  def will_animate_rotate(orientation, duration)
    find.all.reapply_styles
  end
end
