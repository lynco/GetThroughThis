class CreateWebServices < ActiveRecord::Migration
  def change
    create_table :web_services do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
