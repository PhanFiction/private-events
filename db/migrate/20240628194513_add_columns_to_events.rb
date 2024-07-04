class AddColumnsToEvents < ActiveRecord::Migration[7.1]
  def change
    add_column :events, :title, :string
    add_column :events, :description, :text
    add_column :events, :start_date, :date
    add_column :events, :start_time, :time
    add_column :events, :location, :string
    add_reference :events, :creator, foreign_key: { to_table: :users, column: :creator_id }
  end
end
