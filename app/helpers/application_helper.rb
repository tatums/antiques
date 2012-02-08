module ApplicationHelper

  def show_notifcations
    html_output = ""
    html_output << "<div id='notification' class='alert-box success'>" + notice + "<a href='' class='close'>&times;</a></div>"
  end

  def show_alerts
    html_output = ""
    html_output << "<div id='notification' class='alert-box warning'>" + alert + "<a href='' class='close'>&times;</a></div>"
  end

  def sortable(column, title = nil)
      title ||= column.titleize
      direction = (column == sort_column && sort_direction == "asc") ? "desc" : "asc"
      link_to title, :sort => column, :direction => direction
    end
end