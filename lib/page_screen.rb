class PageScreen < UIPageViewController
  include ProMotion::ScreenModule

  attr_accessor :pages, :current_page

  # Customize this method for your preferred initializer

  def on_load
   self.pages = []
   self.current_page = nil
  end

  # dataSource
  def pageViewController(pageViewController, viewControllerBeforeViewController:viewController)
    nil
  end

  def pageViewController(pageViewController, viewControllerAfterViewController:viewController)
    nil
  end

  def presentationCountForPageViewController(pageViewController)
    0
  end

  def presentationIndexForPageViewController(pageViewController)
    0
  end

  # delegate
  def pageViewController(pageViewController, willTransitionToViewControllers:pendingViewControllers)
  end

  def pageViewController(pageViewController, didFinishAnimating:finished, previousViewControllers:previousViewControllers, transitionCompleted:completed)
  end

  def self.new(args = {})
    s = self.alloc.initWithTransitionStyle UIPageViewControllerTransitionStyleScroll,
                    navigationOrientation: UIPageViewControllerNavigationOrientationHorizontal,
                                  options: {
                                    UIPageViewControllerOptionSpineLocationKey: UIPageViewControllerSpineLocationMid
                                  }

    s.screen_init(args) # Important for ProMotion stuff!
    s
  end


   # Highly recommended that you include these methods below

   def loadView
     self.respond_to?(:load_view) ? self.load_view : super
   end

   def viewDidLoad
     super
     self.view_did_load if self.respond_to?(:view_did_load)
   end

   def viewWillAppear(animated)
     super
     self.view_will_appear(animated) if self.respond_to?("view_will_appear:")
   end

   def viewDidAppear(animated)
     super
     self.view_did_appear(animated) if self.respond_to?("view_did_appear:")
   end

   def viewWillDisappear(animated)
     self.view_will_disappear(animated) if self.respond_to?("view_will_disappear:")
     super
   end

   def viewDidDisappear(animated)
     self.view_did_disappear(animated) if self.respond_to?("view_did_disappear:")
     super
   end

   def shouldAutorotateToInterfaceOrientation(orientation)
     self.should_rotate(orientation)
   end

   def shouldAutorotate
     self.should_autorotate
   end

   def willRotateToInterfaceOrientation(orientation, duration:duration)
     self.will_rotate(orientation, duration)
   end

   def didRotateFromInterfaceOrientation(orientation)
     self.on_rotate
   end
 end
