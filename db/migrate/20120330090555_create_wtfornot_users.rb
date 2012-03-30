class CreateWtfornotUsers < ActiveRecord::Migration
  def change
    create_table :wtfornot_users do |t|
      t.integer :user_id
      t.integer :wtfornot_id

      t.timestamps
    end
  end
end
