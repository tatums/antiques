module ShowsHelper

  def formatted_show_with_delete_button_if_logged_in(show)
    if (show.url =~ URI::regexp).nil?
      html_results = show.title + ": " + show.dates
    else
      html_results = "<a href='#{show.url}' class='green'>#{show.title}</a>" + ": " + show.dates
    end
    html_results += " " + link_to('X', show, confirm: 'Are you sure?', method: :delete, :class => 'delete white small button', :remote => true) if current_user
    return html_results.html_safe
  end

end
