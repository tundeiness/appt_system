class AddSpecializationToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :specialization, :string
  end
end
