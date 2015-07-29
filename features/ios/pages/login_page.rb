class IOS::LoginPage < Calabash::Page
  include Calabash::IOS

  def trait
    "button marked:'Sign In'"
  end

  def self_hosted_site
    tap(marked: 'Add Self-Hosted Site')

    wait_for_none_animating
  end

  def login(user,pass,site)
    enter_text_in(user_field, user)
    enter_text_in(pass_field, pass)
    enter_text_in(site_field, site)

    tap(add_site)

    wait_for_login_done
  end

  def more_information
    tap(marked: 'Help')

    page(InfoPage).await
  end


  def assert_can_create_account
    expect_view("* marked:'Create Account'")
  end

# Use 0.11.5 built-in enter-text
#  def enter_text(query_string, text)
#    touch(query_string)
#    wait_for_keyboard
#    keyboard_enter_text text
#  end

  def sign_in
    trait
  end

  def add_site
    "button marked:'Add Site'"
  end

  def user_field
    "* marked:'Username / Email'"
  end

  def pass_field
    "* marked:'Password'"
  end

  def site_field
    "* marked:'Site Address (URL)'"
  end

  def wait_for_login_done
    result = nil
    site_page = page(SitePage)

    wait_for(timeout: 60) do
      if view_exists?("label text:'Need Help?'")
        result = :invalid
      elsif view_exists?(site_page.trait)
        result = :valid
      end
    end


    case result
      when :invalid
        self
      else
        site_page.await(10)
    end
  end

end
