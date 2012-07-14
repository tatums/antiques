module ImagesHelper

  def show_delete_if_logged_in(image)
    if current_user and !visitor_view
      link_to 'X', image, :data => {confirm: 'Are you sure?'}, method: :delete, :remote => true, :class=>'delete-image white small button no-print'
    end
  end

end
