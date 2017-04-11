class AddLastActionToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :last_action, :datetime
  end
end
