class AddFieldsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :status, :integer
    add_column :users, :archive_by_id, :integer
    add_column :users, :status_changed_time, :datetime
  end
end
