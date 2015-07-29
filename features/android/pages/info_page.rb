class Android::InfoPage < Calabash::Page
  include Calabash::Android

  def trait
    "* id:'nux_help_description'"
  end

  def assert_info_present
    expect_views({marked: 'help_button'}, {marked: 'applog_button'})
  end
end

