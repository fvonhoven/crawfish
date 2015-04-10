class AppDelegate < PM::Delegate
  include CDQ

  status_bar true, animation: :fade

  def on_load(app, options)
    cdq.setup

    # Set up motion-concierge
    MotionConcierge.local_file_name = 'seafood_download.json'
    MotionConcierge.remote_file_url = 'https://raw.githubusercontent.com/fvonhoven/crawfish/master/resources/seafood.json'
    MotionConcierge.fetch_interval = 60 #86400 # Once a day

    open HomeScreen.new(nav_bar: true)
  end

  # Check for the data each time the app is launched or returns active
  def on_activate
    MotionConcierge.fetch
  end

  # Remove this if you are only supporting portrait
  def application(application, willChangeStatusBarOrientation: new_orientation, duration: duration)
    # Manually set RMQ's orientation before the device is actually oriented
    # So that we can do stuff like style views before the rotation begins
    device.orientation = new_orientation
  end
end
