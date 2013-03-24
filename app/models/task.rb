class Task < ActiveRecord::Base
  after_create :set_init_position
  validates :title, presence: true

private

  def set_init_position
    incomplete_tasks = Task.where(:completed => false, :deployed => false)
    task = [] << self
    incomplete_tasks -= task
    update_attributes(:position => 1)
    incomplete_tasks.to_enum.with_index(2) do |task, index|
      task.update_attributes(:position => index)
    end
  end

end
