class ChangeStickyTypeInTasks < ActiveRecord::Migration[5.0]
  def change
    change_column :tasks, :sticky, :integer
  end
end
