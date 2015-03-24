class FinderScreen < PM::TableScreen
  title @selected_seafood.to_s
  #refreshable
  searchable placeholder: ("Search")
  row_height :auto, estimated: 44
  attr_accessor :selected_seafood


  def on_load
    # TODO set different seafoods data
    mp @selected_seafood
    @data =   [{
      title: "Boiled Crawfish",
      cells:
      [
        {
          title: "Bevi Seafood Co.",
          subtitle: "Metairie",
          action: :tap_company,
          arguments: { price: "$4.29" },
          image:
          {
          image: "bevi_icon", # PM will do `UIImage.imageNamed("something")` for you
          radius: 15 # radius is optional
          }
          # remote_image: {  # remote image, requires JMImageCache CocoaPod
          # url: "http://placekitten.com/200/300",
          # placeholder: "some-local-image", # NOTE: this is required!
          # size: 50,
          # radius: 15,
          # content_mode: :scale_aspect_fill}
        },
        {
          title: "Cajun Brothers Seafood",
          subtitle: "NOLA",
          action: :tap_company,
          arguments: { price: "$3.99" },
          # image: {
          # image: "bevi_icon", # PM will do `UIImage.imageNamed("something")` for you
          # radius: 15 # radius is optional
          # }
        },
        {
          title: "Cajun Seafood",
          subtitle: "NOLA",
          action: :tap_company,
          arguments: { price: "$4.99" },
          image:
          {
          image: "cajun_icon", # PM will do `UIImage.imageNamed("something")` for you
          radius: 15 # radius is optional
          }
        },
        {
          title: "Frankie & Johnny's",
          subtitle: "NOLA",
          action: :tap_company,
          arguments: { price: "$5.99" },
          image:
          {
          image: "frankie_icon", # PM will do `UIImage.imageNamed("something")` for you
          radius: 15 # radius is optional
          }
        },
        {
          title: "The Galley",
          subtitle: "Metairie",
          action: :tap_company,
          arguments: { price: "$5.99" },
          # image: {
          # image: "galley_icon", # PM will do `UIImage.imageNamed("something")` for you
          # radius: 15 # radius is optional
          # },
        },
        {
          title: "Harbor Seafood",
          subtitle: "Kenner",
          action: :tap_company,
          arguments: { price: "$3.69" },
          image:
          {
          image: "harbor_icon", # PM will do `UIImage.imageNamed("something")` for you
          radius: 15 # radius is optional
          }
        },
        # {
        #   title: "Frankie & Johnny's",
        #   subtitle: "NOLA",
        #   action: :tap_company,
        #   arguments: { price: "$5.99" }
        # },
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