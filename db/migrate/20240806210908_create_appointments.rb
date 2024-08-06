class CreateAppointments < ActiveRecord::Migration[7.1]
  def change
    create_table :appointments do |t|
      t.references :therapist, null: false, foreign_key: { to_table: :users }
      t.references :client, foreign_key: { to_table: :users }
      t.datetime :start_time, null: false
      t.datetime :end_time, null: false

      t.timestamps
    end

    add_index :appointments, %i[therapist_id start_time end_time], unique: true
  end
end
