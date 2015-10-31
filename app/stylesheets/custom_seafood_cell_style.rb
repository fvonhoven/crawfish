class CustomSeafoodCellStyle < ApplicationStylesheet

  def root_view(st)
    st.background_color = color.crawfish_red
  end

  def image_style(st)
    st.image = image.resource('frankie_icon')
    st.content_mode = UIViewContentModeScaleAspectFill
    st.frame = {t: 5, h: 150, l: 10, r: 10, w: screen_width-20}
  end

  def price_text_style(st)
    st.background_color = color.clear
    st.frame = {t: st.prev_frame.top, h: 20, fr: 10, w: 100}
    st.text_alignment = :center
  end

  def name_text_style(st)
    st.background_color = color.clear
    st.frame = {t: 195, h: 20, l: 13, w: screen_width/2}
    st.size_to_fit = true
    st.text_alignment = :left
  end

  def city_text_style(st)
    st.background_color = color.clear
    st.frame = {t: 213, h: 20, l: 13, w: screen_width/2}
    st.size_to_fit = true
    st.font = font.smaller
    st.text_alignment = :left
  end
end