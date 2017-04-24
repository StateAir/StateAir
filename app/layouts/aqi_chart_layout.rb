class AQIChartLayout < MK::Layout

  def layout
    root :main do
      add CPTGraphHostingView, :host_view
    end
  end

  def main_style
    background_color :white.uicolor(0.95)
  end

  def host_view_style
    background_color [255, 102, 0].uicolor

    constraints do
      width '100%'
      height '100%'
      center.equals(:superview)
    end
  end

end
