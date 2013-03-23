module Sort

  def sort
    class_name = params[:controller].capitalize.singularize
    generic_sort(params[:ItemsOrder], class_name)
    render :nothing => true
  end

  private

  def find_products_for_category(category)
    if current_user and !visitor_view
      category.products.includes(:images)
    else
      category.products.includes(:images).active
    end
  end

  def generic_sort(items, klass, category_id=nil)
    items.each_with_index do |id, index|
      if category_id
        klass.constantize.where(:product_id => id.scan(/\d+/), :category_id => category_id).update_all(:position => index+1)
      else
        klass.constantize.where(:id => id.scan(/\d+/)).update_all(:position => index+1)
      end
    end
  end

end