module ApplicationHelper

  # return the full title on the per-page basics
  def full_title(page_title = "")
    base_title = "Ruby on Rails Tutorial Sample App"
    if page_title.empty?
      page_title
    else
      page_title + " | " + base_title
    end
  end
end
