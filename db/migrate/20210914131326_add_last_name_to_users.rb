class AddLastNameToUsers < ActiveRecord::Migration[6.0]
  def change
    add_reference :users, :last_name, null: false, foreign_key: true
  end
end
