class ChangeStickyInTask < ActiveRecord::Migration[5.0]
  def change
    change_column :tasks, :sticky, :boolean
  end
end
