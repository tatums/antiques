module TasksHelper
  def show_title(task)
    if task.completed?
      "<s>#{link_to task.title, edit_task_path(task)}</s>".html_safe
    else
      link_to task.title, edit_task_path(task)
    end
  end

  def finish_button(task)
    unless task.completed?
      link_to 'Finish', task_path(task, :completed => true), :remote => true,
      :data => {confirm: 'Are you sure?'}, method: :put, :class=> 'btn btn-success'
    end
  end

  def deployed_button(task)
    if task.completed?
      link_to 'Deployed', task_path(task, :deployed => true), :remote => true,
      :data => {confirm: 'Are you sure?'}, method: :put, :class=> 'btn btn-warning'
    end
  end

end
