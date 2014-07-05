class CreateTagWebService < ActiveRecord::Migration
  def change
    create_table :tag_web_services do |t|
      t.references :tags, index: true
      t.references :web_services, index: true
    end
  end
end
