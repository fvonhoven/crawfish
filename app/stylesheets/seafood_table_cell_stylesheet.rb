class SeafoodTableCellStylesheet < ApplicationStylesheet

	def root_view(st)
	end

	def price_text_style(st)
		st.background_color = color.clear
		st.frame = {w: 100, h: 20, t: 10, l: 250}
		st.text_alignment = :center
	end
end