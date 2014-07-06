class ServiceTyping < ActiveRecord::Base
  belongs_to :web_service_mode
  belongs_to :web_service
end
