class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :points, :default => 0

      t.timestamps
    end
  end
end
