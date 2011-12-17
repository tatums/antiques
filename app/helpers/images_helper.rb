module ImagesHelper
  
  def show_delete_if_logged_in(image)
    if current_user
      link_to 'delete', image, confirm: 'Are you sure?', method: :delete, :remote => true    
    end
  end

end
