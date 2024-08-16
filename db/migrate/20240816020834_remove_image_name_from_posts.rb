class RemoveImageNameFromPosts < ActiveRecord::Migration[7.0]
  def change
    remove_column :posts, :image_name, :string
  end
end
