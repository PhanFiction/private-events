class AddRef < ActiveRecord::Migration[7.1]
  def change
    add_belongs_to :event_attendees, :events, null: false, foreign_key: true
    add_belongs_to :event_attendees, :users, null: false, foreign_key: true
  end
end
