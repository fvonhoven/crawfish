class FinderScreen < PM::TableScreen
  title @selected_seafood.to_s
  #refreshable
  searchable placeholder: ("Search")
  stylesheet CustomSeafoodCellStyle
  attr_accessor :selected_seafood


  def on_load
    # TODO set different seafoods data
    #given an array of hashes, add another key/value pair to each hash in that array
    @table_data = []

    crawfish_data
    update_table_data

  end

  def crawfish_data
    test_locally = true

    json_string = if test_locally || MotionConcierge.local_file_string.nil?
      #TODO json_string = data
      mp "My data came from the local copy"
      seed_file = NSBundle.mainBundle.pathForResource('seafood', ofType:'json')
      String.new(NSString.stringWithContentsOfFile(seed_file))
    else
      MotionConcierge.local_file_string
    end

    json_data = parse(json_string)

    @data = [add_info(json_data)]
  end

  def add_info json_data
    json_data[:cells].each do |h|
      h[:cell_class] = CustomSeafoodCell
      h[:height] = 260
      # h[:properties] = h[:properties].merge(background_color: color.translucent_black)
      # h[:accessory_type] = :disclosure_indicator
      h[:search_text] = "#{h['subtitle']} #{h[:properties][:price]}"
      h[:action] = "tap_company"
      h[:arguments] = {name: h["name"], city: h["city"], properties: h[:properties]}
    end

    json_data
  end

  def table_data
    @data
  end

  def parse(str_data)
    data = str_data.dataUsingEncoding(NSUTF8StringEncoding)
    opts = NSJSONReadingMutableContainers | NSJSONReadingMutableLeaves | NSJSONReadingAllowFragments
    error = Pointer.new(:id)
    NSJSONSerialization.JSONObjectWithData(data, options:opts, error:error)
  end

  def tap_company company
    mp "#{company[:name]} with:"
    mp company[:properties]
  end
end