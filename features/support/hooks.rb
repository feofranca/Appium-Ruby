Before do
  $driver.start_driver
end

After do
  embed(screenshot, 'image/png', 'Screenshot')
  $driver.driver_quit
end
