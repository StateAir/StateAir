class CityLayout < MK::Layout

  def layout
    root :main do
      add UILabel, :city_label
    end
  end

  def main_style
    background_color :white.uicolor(0.95)
  end

  def city_label_style
    text 'Hi, there!'
    font UIFont.fontWithName('Comic Sans', size: 24)
    size_to_fit

    constraints do
      center.equals(:superview)
    end
  end

end
