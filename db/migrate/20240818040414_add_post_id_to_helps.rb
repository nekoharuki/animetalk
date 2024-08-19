class AddPostIdToHelps < ActiveRecord::Migration[7.0]
  def change
    add_column :helps, :post_id, :integer
  end
end
