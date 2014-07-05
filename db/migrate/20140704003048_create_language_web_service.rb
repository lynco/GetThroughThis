class CreateLanguageWebService < ActiveRecord::Migration
  def change
    create_table :language_web_services do |t|
      t.references :languages, index: true
      t.references :web_services, index: true
    end
  end
end
