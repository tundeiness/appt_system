class CreateTherapists < ActiveRecord::Migration[7.1]
  def change
    create_table :therapists do |t|
      t.references :user, null: false, foreign_key: true
      t.string :specialization

      t.timestamps
    end
  end
end
