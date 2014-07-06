class CreateTagsWebServices < ActiveRecord::Migration
  def change
    create_table :tags_web_services do |t|
      t.references :tag, index: true
      t.references :web_service, index: true
    end
  end
end
