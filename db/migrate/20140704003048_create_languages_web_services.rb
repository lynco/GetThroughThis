class CreateLanguagesWebServices < ActiveRecord::Migration
  def change
    create_table :languages_web_services do |t|
      t.references :language, index: true
      t.references :web_service, index: true
    end
  end
end
