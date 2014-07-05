class CreateWebServiceRelation < ActiveRecord::Migration
  def change
    create_table :web_service_relations do |t|
      t.integer :first_web_service_id
      t.integer :second_web_service_id
    end
  end
end
