class CityScreen < PM::Screen

  attr_accessor :index, :city

  def load_view
    self.view = layout.view
    layout.get(:city_label).text = self.city if self.city
  end

  def on_load
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

  private

  def layout
    @layout ||= CityLayout.new
  end

end
