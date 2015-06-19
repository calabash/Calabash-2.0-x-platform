class InfoPage < Calabash::IOS::Page
  def trait
    "UINavigationBar marked:'Support'"
  end

  def assert_info_present
    expect_views([{marked: 'Activity Logs'}, {marked: 'WordPress Help Center'}])
  end
end
