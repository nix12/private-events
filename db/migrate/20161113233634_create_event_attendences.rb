class CreateEventAttendences < ActiveRecord::Migration
  def change
    create_table :event_attendences do |t|
      t.integer :event_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
