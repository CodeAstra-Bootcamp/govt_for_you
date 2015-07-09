module HomeHelper
  def sidebar_link(text, link, fa_class_name, badge_count = nil)
    content_tag(:div, class: "link") do
      content_tag(:span, '', class: "fa fa-#{fa_class_name}") +
        content_tag(:span, badge_count, class: "badge") +
        link_to(text, link)
    end
  end
end
