class CityLayout < MK::Layout

  def layout
    root :main do
      add UILabel, :city_label

      add UIView, :card do
        add UIView, :card_header do
          add UILabel, :most_recent_aqi_label
          add UILabel, :reading_at
        end
        add UIView, :card_main do
          add UILabel, :aqi_label
          add UILabel, :aqi
          add UILabel, :desc
        end
        add UIView, :card_footer do
          add UILabel, :conc_label
          add UILabel, :conc
        end
      end

      add CPTGraphHostingView, :plot_host

    end
  end

  def main_style
    background_color :white.uicolor(0.95)
  end

  def city_label_style
    text 'Hi, there!'
    font UIFont.fontWithName("Helvetica Neue", size: UIFont.labelFontSize * 2)
    size_to_fit

    constraints do
      center_x.equals(:superview)
      top.equals(:superview).plus(UIApplication.sharedApplication.statusBarFrame.size.height)
    end
  end

  def card_style
    constraints do
      center_x.equals(:superview)
      width.equals(:superview)
      top.equals(:city_label, :bottom)
    end
  end

  def card_header_style
    background_color '#3a75a9'.uicolor

    constraints do
      center_x.equals(:superview)
      width.equals(:superview)
      top.equals(:superview)
    end
  end

  def card_main_style
    constraints do
      center_x.equals(:superview)
      width.equals(:superview)
      top.equals(:card_header, :bottom)
      bottom.equals(:card_footer, :top)
    end
  end

  def card_footer_style
    background_color '#3a75a9'.uicolor

    constraints do
      center_x.equals(:superview)
      width.equals(:superview)
      bottom.equals(:superview)
    end
  end

  def most_recent_aqi_label_style
    text 'Most Recent AQI'
    color :white.uicolor
    font UIFont.fontWithName("Helvetica Neue", size: UIFont.labelFontSize)
    size_to_fit

    constraints do
      center_x.equals(:superview)
      top.equals(:superview)
    end
  end

  def reading_at_style
    text 'Reading At'
    color :white.uicolor
    font UIFont.fontWithName("Helvetica Neue", size: UIFont.systemFontSize)
    size_to_fit

    constraints do
      center_x.equals(:superview)
      top.equals(:most_recent_aqi_label, :bottom)
      bottom.equals(:superview)
    end
  end

  def aqi_label_style
    text 'AQI'
    font UIFont.fontWithName("Helvetica Neue", size: UIFont.labelFontSize)
    size_to_fit

    constraints do
      center_x.equals(:superview)
      top.equals(:superview)
    end
  end

  def aqi_style
    text ''
    font UIFont.fontWithName("Helvetica Neue", size: UIFont.labelFontSize)
    size_to_fit

    constraints do
      center_x.equals(:superview)
      top.equals(:aqi_label, :bottom)
    end
  end

  def desc_style
    text 'Desc'
    font UIFont.fontWithName("Helvetica Neue", size: UIFont.systemFontSize)
    size_to_fit

    constraints do
      center_x.equals(:superview)
      top.equals(:aqi, :bottom)
      bottom.equals(:superview)
    end
  end

  def conc_label_style
    text 'Conc'
    color :white.uicolor
    font UIFont.fontWithName("Helvetica Neue", size: UIFont.systemFontSize)
    size_to_fit

    constraints do
      center_x.equals(:superview)
      top.equals(:superview)
    end
  end

  def conc_style
    text ''
    color :white.uicolor
    font UIFont.fontWithName("Helvetica Neue", size: UIFont.systemFontSize)
    size_to_fit

    constraints do
      center_x.equals(:superview)
      top.equals(:conc_label, :bottom)
      bottom.equals(:superview)
    end
  end

  def plot_host_style
    background_color :clear.uicolor

    constraints do
      center_x.equals(:superview)
      width.equals(:superview)
      top.equals(:card, :bottom)
      bottom.equals(:superview)
    end
  end

end
