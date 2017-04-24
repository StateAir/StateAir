class CitiesScreen < PageScreen

  attr_accessor :current_page, :cities

  def on_load
    self.cities = [:beijing, :chengdu, :guangzhou, :shanghai, :shenyang]
    self.pages = self.cities.map.with_index { |city, index| CityScreen.new city: city, index: index }
    self.current_page = self.pages.first

    self.dataSource = self
    self.delegate = self

    self.setViewControllers self.pages.take(1), direction: UIPageViewControllerNavigationDirectionForward, animated: true, completion: nil
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

  # dataSource
  def pageViewController(pageViewController, viewControllerBeforeViewController:viewController)
    if viewController
      return self.pages.last if viewController.index <= 0
      return self.pages[viewController.index - 1]
    end

    # viewController.nil? ?
    #   nil
    #   :
    #   viewController.index <= 0 ? self.pages.last : self.pages[viewController.index - 1]

    nil
  end

  def pageViewController(pageViewController, viewControllerAfterViewController:viewController)
    if viewController
      return self.pages.first if viewController.index >= self.pages.count - 1
      return self.pages[viewController.index + 1]
    end

    nil
  end

  def presentationCountForPageViewController(pageViewController)
    self.pages.count
  end

  def presentationIndexForPageViewController(pageViewController)
    self.current_page.index
  end

  # delegate
  def pageViewController(pageViewController, willTransitionToViewControllers:pendingViewControllers)
    self.current_page = pendingViewControllers
  end

  def pageViewController(pageViewController, didFinishAnimating:finished, previousViewControllers:previousViewControllers, transitionCompleted:completed)
  end

end
