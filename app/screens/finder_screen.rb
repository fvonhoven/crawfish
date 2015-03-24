class FinderScreen < PM::TableScreen
  title @selected_seafood.to_s
  #refreshable
  searchable placeholder: ("Search" + @selected_seafood.to_s)
  row_height :auto, estimated: 44
  attr_accessor :selected_seafood


  def on_load
    mp @selected_seafood
    @data =   [{
      title: "Boiled Crawfish",
      cells:
      [
        {
          title: "Bevi Seafood Co.",
          subtitle: "Metairie",
          action: :tap_company,
          arguments: { price: "$4.29" }
        },
        {
          title: "Cajun Brothers Seafood",
          subtitle: "NOLA",
          action: :tap_company,
          arguments: { price: "$3.99" }
        },
        {
          title: "Cajun Seafood",
          subtitle: "NOLA",
          action: :tap_company,
          arguments: { price: "$4.99" }
        },
        {
          title: "Frankie & Johnny's",
          subtitle: "NOLA",
          action: :tap_company,
          arguments: { price: "$5.99" }
        },
        {
          title: "The Galley",
          subtitle: "Metairie",
          action: :tap_company,
          arguments: { price: "$5.99" }
        },
        {
          title: "Harbor Seafood",
          subtitle: "Kenner",
          action: :tap_company,
          arguments: { price: "$4.29" }
        },
        {
          title: "Frankie & Johnny's",
          subtitle: "NOLA",
          action: :tap_company,
          arguments: { price: "$5.99" }
        },
      ]
    }]
  end

  def table_data
    @data
  end

  def tap_company company
    #value = state.each_value {|value| p "VISIT #{value.upcase} MO FUCKA"}
    p "#{company[:price].upcase}\/lb."
  end
end