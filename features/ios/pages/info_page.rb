class IOS::InfoPage < Calabash::Page
  include Calabash::IOS

  def trait
    "UINavigationBar marked:'Support'"
  end

  def assert_info_present
    expect_views({marked: 'Activity Logs'}, {marked: 'WordPress Help Center'})
  end
end
