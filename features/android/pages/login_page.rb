class Android::LoginPage < Calabash::Page
  include Calabash::Android

  def trait
    "android.widget.TextView text:'Sign in'"
  end

  def self_hosted_site
    dismiss_keyboard

    tap(marked: add_self_hosted_site_button)
  end

  def login(user,pass,site)
    enter_text_in(user_field, user)
    enter_text_in(pass_field, pass)
    enter_text_in(site_field, site)

    dismiss_keyboard

    tap(sign_in)

    wait_for_login_done
  end

  def assert_can_create_account
    expect_view("* id:'nux_create_account_button'")
  end

  def more_information
    tap(marked: 'info_button')
    page(InfoPage).await
  end

  def sign_in
    "android.widget.TextView text:'Sign in'"
  end

  def user_field
    field('nux_username')
  end

  def pass_field
    field('nux_password')
  end

  def site_field
    field('nux_url')
  end

  def field(field_id)
    "android.widget.TextView id:'#{field_id}'"
  end

  def add_self_hosted_site_button
    'Add self-hosted site'
  end

  def wait_for_login_done
    result = nil
    wait_for(timeout: 120) do
      if view_exists?("* {text BEGINSWITH 'The username or'}")
        result = :invalid
      elsif view_exists?("* marked:'Posts'")
        result = :valid
      end
    end

    case result
      when :invalid
        self
      else
        page(SitePage)
    end
  end
end
