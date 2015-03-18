class HomeScreenStylesheet < ApplicationStylesheet

  def setup
    # Add sytlesheet specific setup stuff here.
    # Add application specific setup stuff in application_stylesheet.rb
  end

  def root_view(st)
    st.background_image = image.resource('crawfish.png')
    #st.frame = {t: 50, l: 0}#w: screen_width, height: screen_height}
  end

  def hello_world(st)
    st.frame = {t: 100, w: 200, h: 18, centered: :horizontal}
    st.text_alignment = :center
    st.color = color.black
    st.font = font.medium
    st.text = 'Crawfish'
  end

  def picker(st)
    st.view.showsSelectionIndicator = true
    st.frame = {centered: :both}
  end

end
