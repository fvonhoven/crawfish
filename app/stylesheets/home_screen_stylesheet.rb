class HomeScreenStylesheet < ApplicationStylesheet

  def setup
    # Add sytlesheet specific setup stuff here.
    # Add application specific setup stuff in application_stylesheet.rb
  end

  def root_view(st)
    st.background_image = image.resource('crawfish.png')
    #st.frame = {t: 50, l: 0}#w: screen_width, height: screen_height}
  end

  def picker_choices_text_field(st)
    st.frame = {l: 10, t:120, w: screen_width - 60, h:45}
    st.background_color = color.white
    st.alpha = 0.45
    st.corner_radius = 5
    st.font = font.medium
    st.text_alignment = :center
    st.view.setLeftViewMode(UITextFieldViewModeAlways)
    st.view.setLeftView(UIView.alloc.initWithFrame([[0,0],[0,10]]))
  end

  def form(st)
    st.frame = {l: 20, t: 80, w: screen_width - 40, h: screen_height - 95}
    # st.background_color = color.black
    # st.alpha = 0.2
    st.corner_radius = 10
    st.content_size = CGSizeMake(st.frame.width, st.frame.height)
  end


  def send_button(st)
    st.frame = {centered: :horizontal, t: 520, w:120, h: 50}
    st.corner_radius = 5
    st.border_width = 5
    st.background_color = color.red
    st.border_color = color.black
    st.text = "FIND"
    st.font = font.large
    st.color = color.white
  end
end
