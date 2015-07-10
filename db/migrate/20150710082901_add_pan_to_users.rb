class AddPanToUsers < ActiveRecord::Migration
  def change
    add_column :users, :pan, :string
    add_index :users, :pan, unique: true
  end
end
