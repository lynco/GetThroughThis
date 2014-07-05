class CreateWebServiceTypeWebService < ActiveRecord::Migration
  def change
    create_table :web_service_type_web_services do |t|
      t.references :web_service_types, index: true
      t.references :web_services, index: true
    end
  end
end
