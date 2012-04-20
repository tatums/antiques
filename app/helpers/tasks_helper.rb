module TasksHelper
  def show_title(task)
    if task.completed?
      "<s>#{link_to task.title, task}</s>".html_safe
    else
      link_to task.title, task
    end
  end

end
