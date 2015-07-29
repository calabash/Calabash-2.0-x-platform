class Android::SitePage < Calabash::Page
  include Calabash::Android

  def trait
    "* marked:'Posts'"
  end

  def to_posts
    # Todo: improve this
    index = query({marked: 'Posts'}).length - 1

    tap({marked: 'Posts', index: index})
  end
end
