module VisitorViewHelper
  def visitor_view_link
    if visitor_view
      link_to "Disable Visitor View", disable_visitor_view_path, method: 'post', class: 'btn btn-small btn-primary'
    else
      link_to "Enable Visitor View", enable_visitor_view_path, method: 'post', class: 'btn btn-small btn-primary'
    end
  end

end
