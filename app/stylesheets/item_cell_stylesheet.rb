module ItemCellStylesheet
  def item_cell_height
    80
  end

  def item_cell(st)
    # Style overall cell here
    st.background_color = color.random
  end

  def cell_label(st)
    st.color = color.black
  end

  def cell_detail_label(st)
    st.color = color.black
  end
end
