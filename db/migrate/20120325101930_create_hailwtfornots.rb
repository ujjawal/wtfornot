class CreateHailwtfornots < ActiveRecord::Migration
  def change
    create_table :hailwtfornots do |t|
      t.string :title
      t.string :url
      t.integer :user_id
      t.integer :points, :default => 1
      t.integer :image1
      t.integer :image2

      t.timestamps
    end
  end
end
