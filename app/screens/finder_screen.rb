class FinderScreen < PM::TableScreen
  title @selected_seafood.to_s
  #refreshable
  searchable placeholder: ("Search")
  row_height :auto, estimated: 44
  attr_accessor :selected_seafood


  def on_load
    # TODO set different seafoods data
    mp @selected_seafood

    unless json_string = MotionConcierge.local_file_string
      mp "My data came from the local copy"
      seed_file = NSBundle.mainBundle.pathForResource('seafood', ofType:'json')
      json_string = String.new(NSString.stringWithContentsOfFile(seed_file))
    end
    @data = [parse(json_string)]

    update_table_data

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
    #value = state.each_value {|value| p "VISIT #{value.upcase} MO FUCKA"}
    p "#{company[:price].upcase}\/lb."
  end
end