describe CitiesScreen do
  tests CitiesScreen

  def cities_screen
    @cities_screen ||= CitiesScreen.new(nav_bar: false)
  end

  def controller
    cities_screen.navigationController
  end

  after { @cities_screen = nil }

  it "is a UIPageViewController" do
    cities_screen.should.be.kind_of(UIPageViewController)
  end

end
