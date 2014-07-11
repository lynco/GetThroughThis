class AddLinkTypeToDownloadUrls < ActiveRecord::Migration
  def change
    add_column :download_urls, :link_type, :string
  end
end
