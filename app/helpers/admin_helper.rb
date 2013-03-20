module AdminHelper

  def class_name_for(configuration)
    'active' if configuration.current?
  end

end
