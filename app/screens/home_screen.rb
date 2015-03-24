class HomeScreen < PM::Screen
  title "Where Dat Crawfish"
  stylesheet HomeScreenStylesheet

  CHOICES = ["Crawfish", "Shrimp", "Crabs", "Oysters"]

  def on_load
    # TODO add image upload of pictures of people eating crawfish at the different places
    #set_nav_bar_button :left, system_item: :camera, action: :nav_left_button
    # TODO build pickerView => screens
    #set_nav_bar_button :right, title: "Find", action: :nav_right_button
    rmq.append(UIScrollView, :form).tap do |q|
      @seafood_choices = q.append!(UITextField, :picker_choices_text_field)
      @seafood_choices.text = CHOICES.first
      rmq.append(UIButton, :send_button).on(:tap) do
        open FinderScreen.new(selected_seafood: @seafood_choices.text)
      end
    end
    set_picker_nav_bar
    create_picker
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
    CHOICES.size
  end

  def pickerView(pickerView, titleForRow:row, forComponent:component)
    CHOICES[row]
  end

  def pickerView(pickerView, didSelectRow:row, inComponent:component)
    @seafood_choices.text = CHOICES[row] #||= CHOICES[0]
  end

  def set_picker_nav_bar
    @picker_nav_bar = MIMInputToolbar.new
    @picker_nav_bar.previous_title = ""
    @picker_nav_bar.next_title = ""
    @picker_nav_bar.fields = [@seafood_choices]
  end

  def create_picker
    picker = UIPickerView.new
    picker.showsSelectionIndicator = true
    picker.dataSource = self
    picker.delegate = self
    @seafood_choices.inputView = picker
    @seafood_choices.inputAccessoryView = @picker_nav_bar
  end
end
