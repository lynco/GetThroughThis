class CreateServiceUseModesWebServices < ActiveRecord::Migration
  def change
    create_table :service_use_modes_web_services do |t|
      t.references :service_use_mode, index: true
      t.references :web_service, index: true
    end
  end
end
