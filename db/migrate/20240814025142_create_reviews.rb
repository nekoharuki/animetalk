class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.integer :user_id
      t.integer :post_id
      t.integer :point
      t.string :comment

      t.timestamps
    end
  end
end
