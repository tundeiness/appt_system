class CreatePairs < ActiveRecord::Migration[7.1]
  def change
    create_table :pairs do |t|
      t.references :client, null: false, foreign_key: { to_table: :users }
      t.references :therapist, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
    add_index :pairs, %i[client_id therapist_id], unique: true
  end
end
