class AddCol < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :username, :string
    
    add_column :events, :title, :string
    add_column :events, :description, :text
  end
end
