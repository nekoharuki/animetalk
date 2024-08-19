class CreateHelps < ActiveRecord::Migration[7.0]
  def change
    create_table :helps do |t|
      t.integer :user_id
      t.integer :review_id

      t.timestamps
    end
  end
end
