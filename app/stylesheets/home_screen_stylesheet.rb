class HomeScreenStylesheet < ApplicationStylesheet

  def setup
    # Add sytlesheet specific setup stuff here.
    # Add application specific setup stuff in application_stylesheet.rb
  end

  def root_view(st)
    st.background_image = image.resource('crawfish.jpg')
    st.frame = {t: 0, l: 0, w: screen_width, height: screen_height}
  end

  def hello_world(st)
    st.frame = {t: 100, w: 200, h: 18, centered: :horizontal}
    st.text_alignment = :center
    st.color = color.battleship_gray
    st.font = font.medium
    st.text = 'Crawfish'
  end

  def picker(st)
    st.view.showsSelectionIndicator = true
    st.frame = {centered: :both}
  end

end
