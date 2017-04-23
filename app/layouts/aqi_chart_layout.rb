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
    frame self.view.frame
    background_color :blue.uicolor(0.95)
  end

end
