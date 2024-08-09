class CreateSchedules < ActiveRecord::Migration[7.1]
  def change
    create_table :schedules do |t|
      t.references :therapist, null: false, foreign_key: { to_table: :users }
      t.datetime :start_time, null: false
      t.datetime :end_time, null: false

      t.timestamps
    end

    # Add an index to ensure that there are no overlapping schedules for a therapist
    add_index :schedules, %i[therapist_id start_time end_time], unique: true
  end
end
