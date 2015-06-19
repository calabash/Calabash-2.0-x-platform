class SitePage < Calabash::Android::Page
  def trait
    "* marked:'Posts'"
  end

  def to_posts
    touch(query("* marked:'Posts'").last)
  end
end
