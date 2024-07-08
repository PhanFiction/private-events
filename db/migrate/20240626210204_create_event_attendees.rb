class CreateEventAttendees < ActiveRecord::Migration[7.1]
  def change
    create_table :event_attendees do |t|
      t.references :attendee, foreign_key: { to_table: :users, column: :attendee_id }
      t.references :attended_events, foreign_key: { to_table: :events, column: :attended_events_id }
      t.timestamps
    end
  end
end
