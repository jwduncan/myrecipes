class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.text :description
      t.integer :chef_id
      t.integer :recipe_id
      t.timestamps
    end
  end
end
