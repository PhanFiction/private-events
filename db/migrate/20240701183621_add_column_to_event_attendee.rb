class AddColumnToEventAttendee < ActiveRecord::Migration[7.1]
  def change
    # add_reference :event_attendees, :users, foreign_key: { to_table: :users, column: :creator_id }
    # add_reference :event_attendees, :events, foreign_key: { to_table: :users, column: :creator_id }
  end
end
