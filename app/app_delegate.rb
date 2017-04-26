class AppDelegate < PM::Delegate
  status_bar true, animation: :none

  def on_load(app, options)
    return true if RUBYMOTION_ENV == "test"
    open CitiesScreen.new(nav_bar: false)

    UINavigationBar.appearance.tintColor = :white.uicolor
    UINavigationBar.appearance.barTintColor = [255, 102, 0].uicolor
    UINavigationBar.appearance.setTitleTextAttributes(
      NSForegroundColorAttributeName => :white.uicolor,
      NSBaselineOffsetAttributeName => 0,
      NSFontAttributeName => 'HelveticaNeue-Bold'.uifont(:label.uifontsize)
    )
    UINavigationBar.appearance.setBackIndicatorImage icon_image(:awesome, :arrow_circle_left, size: :label.uifontsize, color: :white.uicolor)
    UINavigationBar.appearance.setBackIndicatorTransitionMaskImage icon_image(:awesome, :arrow_circle_o_left, size: :label.uifontsize, color: :white.uicolor)
    UIPageControl.appearance.setPageIndicatorTintColor :gray.uicolor
    UIPageControl.appearance.setCurrentPageIndicatorTintColor :white.uicolor
    UIPageControl.appearance.setBackgroundColor :white.uicolor(0.1)
    UIPageControl.appearance.setOpaque true
  end

end
