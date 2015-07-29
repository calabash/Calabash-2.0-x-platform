class IOS::SitePage < Calabash::Page
  include Calabash::IOS

  def trait
    "* marked:'Me'"
  end

  def to_posts
    wait_for_none_animating
    tap(trait)
    wait_for_none_animating
    if view_exists?("* marked:'Calabash Blog'")
      tap("* marked:'Calabash Blog'")
      wait_for_none_animating
    end
    tap("* marked:'Posts'")
    wait_for_none_animating
  end
end