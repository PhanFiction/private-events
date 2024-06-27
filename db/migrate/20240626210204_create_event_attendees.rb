class CreateEventAttendees < ActiveRecord::Migration[7.1]
  def change
    create_table :event_attendees do |t|
      
      t.timestamps
    end
  end
end
