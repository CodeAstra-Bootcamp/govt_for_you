module ApplicationHelper
  def resource_name
    :user
  end
 
  def resource
    @resource ||= User.new
  end
 
  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
  
  def flash_tag(msg, msg_type)
    return unless msg.present?
    if msg_type == "notice"
      msg_type = "info"
    elsif msg_type == "alert"
      msg_type = "danger"
    end

    content_tag(:div, class: "alert alert-#{msg_type} alert-dismissible", role: "alert") do
      button_tag(class: "close", "data-dismiss" => "alert") do 
        content_tag(:span, raw("&times;"), "aria-hidden" => true) +
          content_tag(:span, "Close", class: "sr-only")
      end + msg
    end
  end

  # +boxes_data+ is an array of hashes with keys: link, text and fa_icon
  def action_links_boxes_tags(boxes_data)
    inner_content = ""
    boxes_data.each_index do |i|
      inner_content += action_link_box_tag(boxes_data[i], i+1)
    end

    content_tag(:div, class: "container-fluid") do
      content_tag(:div, class: "row action-links-boxes") do
        raw inner_content
      end
    end
  end

  def action_link_box_tag(box_data, index)
    content_tag(:div, class: "col-md-4 action-box action-box-#{index}") do
      link_to(raw(box_data[:text] + content_tag(:i, "", class: "fa fa-#{box_data[:fa_icon]}")), box_data[:link])
    end
  end
end
