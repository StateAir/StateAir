class AQIChartScreen < PM::Screen

  attr_accessor :timestamp, :aqi
  attr_accessor :index
  attr_accessor :city

  def self.new(args = {})
    super

    if args[:city]
      @city = args[:city]
    else
      @city = [:beijing, :shanghai, :shenyang, :chengdu, :guangzhou].sample
    end
  end

  def load_view
    self.view = layout.view
  end

  def on_load
    StateAir.latest(@city) do |res|
      @timestamp, @aqi = res.map {|i| [i['timestamp'], i['aqi']]}.transpose
      setup_chart(@timestamp, @aqi)
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
    @timestamp.count
  end

  def numberForPlot(plot, field:fieldEnum, recordIndex:index)
    if fieldEnum == CPTScatterPlotFieldX # x
      return @timestamp[index]
    else
      return @aqi[index]
    end
  end

  private

  def layout
    @layout ||= AQIChartLayout.new
  end

  def host_view
    layout.get(:host_view)
  end

  def graph
    @graph ||= CPTXYGraph.alloc.initWithFrame(host_view.bounds).tap do |g|
      host_view.hostedGraph = g
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

  def setup_chart(x, y)
    plot_space.setYRange CPTPlotRange.plotRangeWithLocation(0, length:['500', y.max*2].min)
    plot_space.setXRange CPTPlotRange.plotRangeWithLocation(x.min, length:x.max-x.min)

    graph.addPlot plot, toPlotSpace: plot_space
  end

end
