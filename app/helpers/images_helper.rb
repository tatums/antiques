module ImagesHelper
  
  def show_delete_if_logged_in(image)
    if current_user
      link_to 'X', image, confirm: 'Are you sure?', method: :delete, :remote => true, :class=>'delete-image white small button'    
    end
  end

end
