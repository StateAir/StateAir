class CityScreen < PM::Screen

  attr_accessor :index, :city, :items

  def load_view
    self.view = layout.view
    layout.get(:city_label).text = self.city if self.city
  end

  def on_load
    StateAir.latest(self.city) do |res|
      self.items = res
      setup_chart
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
      return self.items[index]['aqi']
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

  def plot
    @plot ||= CPTScatterPlot.new.tap do |pl|
      pl.dataSource = self
    end
  end

  def setup_chart
    x, y = self.items.map {|i| [i['timestamp'], i['aqi']]}.transpose

    plot_space.setYRange CPTPlotRange.plotRangeWithLocation(0, length:['500', y.max*2].min)
    plot_space.setXRange CPTPlotRange.plotRangeWithLocation(x.min, length:x.max-x.min)

    graph.addPlot plot, toPlotSpace: plot_space
  end

end
