class AddImageFileToImage < ActiveRecord::Migration
  def up
    add_attachment :images, :image_file
  end

  def down
    remove_attachment :images, :image_file
  end
end
