class CreateDownloadUrls < ActiveRecord::Migration
  def change
    create_table :download_urls do |t|
      t.string :url
      t.integer :web_service_id
    end
  end
end
