class CityScreen < PM::Screen

  attr_accessor :index, :city, :items

  def load_view
    self.view = layout.view
    layout.get(:city_label).text = self.city if self.city
  end

  def on_load
    StateAir.latest(self.city) do |res|
      self.items = res.sort{|x,y| x['timestamp']<=>y['timestamp']}
      update_labels
      update_chart
    end
  end

  def on_init
  end

  def will_appear
    # just before the view appears
  end

  def on_appear
    # just after the view appears
  end

  def will_disappear
    # just before the view disappears
  end

  def on_disappear
    # just after the view disappears
  end

  def numberOfRecordsForPlot plotnumberOfRecords
    self.items.count
  end

  def numberForPlot(plot, field:fieldEnum, recordIndex:index)
    if fieldEnum == CPTScatterPlotFieldX # x
      return self.items[index]['timestamp']
    else
      return self.items[index]['aqi'] if plot == aqi_plot
      return self.items[index]['conc'] if plot == conc_plot
    end
  end

  private

  def layout
    @layout ||= CityLayout.new
  end

  def plot_host
    layout.get(:plot_host)
  end

  def graph
    @graph ||= CPTXYGraph.alloc.initWithFrame(plot_host.bounds).tap do |g|
      plot_host.hostedGraph = g
    end
  end

  def plot_space
    graph.defaultPlotSpace
  end

  def aqi_plot
    @aqi_plot ||= CPTBarPlot.new.tap do |pl|
      pl.dataSource = self
      pl.lineStyle = CPTMutableLineStyle.new.tap do |barLineStyle|
        barLineStyle.lineWidth = 5
        barLineStyle.lineColor = :light_gray.uicolor
      end
    end
  end

  def conc_plot
    @conc_plot ||= CPTScatterPlot.new.tap do |pl|
      pl.dataSource = self
    end
  end

  def update_labels
    layout.get(:reading_at).text = self.items.last['reading_at']
    layout.get(:aqi).text = self.items.last['aqi']
    layout.get(:desc).text = self.items.last['desc']
    layout.get(:conc).text = self.items.last['conc']
  end

  def update_chart
    x, y_aqi, y_conc = self.items.map {|i| [i['timestamp'], i['aqi'], i['conc']]}.transpose

    step = (x.max - x.min) / (x.count - 1)

    plot_space.setYRange CPTPlotRange.plotRangeWithLocation(0, length:['500', [y_aqi.max, y_conc.max].max*1.2].min)
    plot_space.setXRange CPTPlotRange.plotRangeWithLocation(x.min - step/2, length:x.max-x.min + step)

    graph.addPlot aqi_plot, toPlotSpace: plot_space
    graph.addPlot conc_plot, toPlotSpace: plot_space
  end

end
